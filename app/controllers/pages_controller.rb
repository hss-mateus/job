class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    flash[:notice] = "Company created, please login again" if params[:new] == "true"
  end
end
