class Company
  class ResumesController < ApplicationController
    before_action :set_resume, only: [:show]

    def index
      @resumes = Resume.all
    end

    def show; end

    private

    def set_resume
      @resume = Resume.find(params[:id])
    end
  end
end
