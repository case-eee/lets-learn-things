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

  describe "GET /api/v1/companies/with_modern_plan" do
    it "returns a list of companies with a modern plan" do
      penelope = Company.create!(name: "Penelope's Shop", plan_level: "enterprise")
      abc = Company.create!(name: "ABC's Shop", plan_level: "legacy")

      get "/api/v1/companies/with_modern_plan"

      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["companies"].length).to eq(1)
    end
  end

  describe "GET /api/v1/companies/not_trialing" do
    it "returns a list of companies that are not currently trialing" do
      penelope = Company.create!(name: "Penelope's Shop", plan_level: "enterprise", trial_status: 2.days.from_now)
      abc = Company.create!(name: "ABC's Shop", plan_level: "legacy", trial_status: 5.days.ago)
      zebra = Company.create!(name: "Zebra's Shop", plan_level: "legacy", trial_status: 2.days.ago)

      get "/api/v1/companies/not_trialing"

      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["companies"].length).to eq(2)
    end
  end

  describe "GET /api/v1/companies/created_last_month" do
    it "returns a list of companies that were created_last_month" do
      penelope = Company.create!(name: "Penelope's", plan_level: "enterprise", trial_status: 2.days.from_now, created_at: 1.month.ago)
      abc = Company.create!(name: "ABC's", plan_level: "basic", trial_status: 5.days.from_now, created_at: 2.months.ago)
      zebra = Company.create!(name: "Zebra Company", plan_level: "legacy", trial_status: Time.current)

      get "/api/v1/companies/created_last_month"

      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["companies"].length).to eq(1)
    end
  end
end