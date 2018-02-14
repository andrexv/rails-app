class EmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    JobMailer.created.deliver
  end
end
