class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      @company.company_accesses.create(user: current_user, role: :admin)
      redirect_to root_url(subdomain: @company.subdomain, new: true)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :subdomain)
  end
end
