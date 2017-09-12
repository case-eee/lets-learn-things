class Api::V1::CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: {companies: companies}
  end

  def alphabetically
    companies = Company.sort_alphabetically
    render json: {companies: companies}
  end
end