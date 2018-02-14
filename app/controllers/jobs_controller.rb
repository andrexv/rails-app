class JobsController < ApplicationController

  def create
    Job.send_mail

    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end
end
