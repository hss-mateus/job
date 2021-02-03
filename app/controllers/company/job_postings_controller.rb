class Company
  class JobPostingsController < ApplicationController
    before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

    def index
      @job_postings = current_company.job_postings
    end

    def show; end

    def new
      @job_posting = JobPosting.new
    end

    def edit; end

    def create
      @job_posting = current_company.job_postings.new(job_posting_params)

      if @job_posting.save
        redirect_to company_job_postings_path, notice: "Job posting created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @job_posting = current_company.job_postings.new(job_posting_params)

      if @job_posting.save
        redirect_to company_job_posting_path(@job_posting), notice: "Job posting updated"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @job_posting.destroy

      redirect_to company_job_postings_path, notice: "Job posting deleted"
    end

    private

    def set_job_posting
      @job_posting = current_company.job_postings.find(params[:id])
    end

    def job_posting_params
      params.require(:job_posting).permit(:title, :description)
    end
  end
end
