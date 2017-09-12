class Api::V1::CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: {companies: companies}
  end

  def alphabetically
    companies = Company.sort_alphabetically
    render json: {companies: companies}
  end

  def with_modern_plan
    companies = Company.with_modern_plan
    render json: {companies: companies}
  end
end