class JobsController < ApplicationController

  def create
    EmailJob.perform_later

    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end
end
