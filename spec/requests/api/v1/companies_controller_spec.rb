require "rails_helper"

describe "CompaniesController" do

  describe "GET /api/v1/companies" do
    it "returns a list of companies" do
      company = Company.create!(name: "Penelope's Shop", plan_level: "enterprise")

      get "/api/v1/companies"

      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["companies"].length).to eq(1)
    end
  end

  describe "GET /api/v1/companies/alphabetically" do
    it "returns a list of companies sorted alphabetically by name" do
      penelope = Company.create!(name: "Penelope's Shop", plan_level: "enterprise")
      abc = Company.create!(name: "ABC's Shop", plan_level: "enterprise")

      get "/api/v1/companies/alphabetically"

      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["companies"].first["name"]).to eq(abc.name)
      expect(parsed_response["companies"].second["name"]).to eq(penelope.name)
    end
  end
end