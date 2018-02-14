class ResourceJobsController < ApplicationController

  def create

    ResourceJob.send_mail
    
    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end
end
