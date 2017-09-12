require "rails_helper"

describe "CompaniesController" do

  describe "GET /api/v1/companies" do
    it "returns a list of companies" do
      company = Company.create!(name: "Penelope's Shop", plan_level: "enterprise")

      get "/api/v1/companies"

      parsed_response = JSON.parse(response.body)
      expect(parsed_response["companies"].length).to eq(1)
    end
  end
end