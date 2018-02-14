require "bunny"

class RabbitmqAdapter
  include Concurrent::ExecutorService

  def initialize
    @conn = Bunny.new
    @conn.start

    @ch = @conn.create_channel

    default_executor_options = {
      min_threads:     2,
      max_threads:     2,
      idletime:        60, # 1 minute
      max_queue:       0, # unlimited
      auto_terminate:  false # Let shutdown modes handle thread termination
    }

    @q = @ch.queue("job_queue", :durable => true)
    thread = Concurrent::ThreadPoolExecutor.new(default_executor_options)

    begin
      @q.subscribe do |delivery_info, properties, body|
        puts " [-] Received '#{body}'"
        job_data = ActiveSupport::JSON.decode(body)
        thread.post do 
          job_data["job_class"].constantize.new.perform
        end
        puts " [-] Done"
      end
    rescue Interrupt => _
      conn.close
    end  
  end

  def enqueue(job) #:nodoc:
    @q.publish(ActiveSupport::JSON.encode(job.serialize))
  end

  def enqueue_at(job, timestamp) #:nodoc:
    raise NotImplementedError, "This queueing backend does not support scheduling jobs. To see what features are supported go to http://api.rubyonrails.org/classes/ActiveJob/QueueAdapters.html"
  end

end