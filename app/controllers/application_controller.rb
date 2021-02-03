class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def current_company
    @current_company ||= Company.find_by(subdomain: request.subdomain)
  end
end
