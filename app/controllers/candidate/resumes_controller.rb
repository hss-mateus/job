module Candidate
  class ResumesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_resume, only: [:show, :edit, :update, :destroy]
    before_action :check_existence, only: [:new, :create]

    def show; end

    def new
      @resume = Resume.new
    end

    def edit; end

    def create
      @resume = current_user.build_resume(resume_params)

      if @resume.save
        redirect_to candidate_resume_path, notice: "Resume was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @resume.update(resume_params)
        redirect_to candidate_resume_path, notice: "Resume was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @resume.destroy
      redirect_to root_path, notice: "Resume was successfully destroyed."
    end

    private

    def set_resume
      @resume = current_user.resume

      redirect_to new_candidate_resume_path if @resume.nil?
    end

    def check_existence
      redirect_to candidate_resume_path if current_user.resume.present?
    end

    def resume_params
      params.require(:resume).permit(:address, :description, :experience, :education)
    end
  end
end
