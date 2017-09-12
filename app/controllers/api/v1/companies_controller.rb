class Api::V1::CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: {companies: companies}
  end
end