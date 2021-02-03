module Candidate
  class JobPostingsController < ApplicationController
    before_action :set_job_posting, only: [:show, :apply]

    def index
      @job_postings = JobPosting.all
    end

    def show; end

    def apply
      if current_user.resume.nil?
        redirect_to candidate_resume_path, alert: "You need a resume first"
        return
      end

      job_application = current_user.job_applications.new(job_posting: @job_posting)

      if job_application.save
        flash[:notice] = "Job application created"
      else
        flash[:alert] = "You already applied for this position"
      end

      redirect_to candidate_job_postings_path
    end

    private

    def set_job_posting
      @job_posting = JobPosting.find(params[:job_posting_id] || params[:id])
    end
  end
end
