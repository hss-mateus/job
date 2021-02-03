module Candidate
  class JobApplicationsController < ApplicationController
    before_action :set_job_application, only: [:show]

    def index
      @job_applications = current_user.job_applications
    end

    def show; end

    private

    def set_job_application
      @job_application = current_user.job_applications.find(params[:id])
    end
  end
end
