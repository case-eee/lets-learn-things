require "rails_helper"

describe Company do
  context "validations" do
    it { is_expected.to define_enum_for(:plan_level).with([:legacy, :custom, :basic, :plus, :growth, :enterprise]) }
  end

  describe ".sort_alphabetically" do
    it "returns a list of companies sorted alphabetically by name" do
      penelope = Company.create!(name: "Penelope's", plan_level: "enterprise")
      abc = Company.create!(name: "ABC's", plan_level: "enterprise")
      zebra = Company.create!(name: "Zebra Company", plan_level: "enterprise")

      expect(Company.sort_alphabetically).to eq([abc, penelope, zebra])
    end
  end

  describe ".with_modern_plan" do
    it "returns a list of companies with a modern plan" do
      penelope = Company.create!(name: "Penelope's", plan_level: "enterprise")
      abc = Company.create!(name: "ABC's", plan_level: "basic")
      zebra = Company.create!(name: "Zebra Company", plan_level: "legacy")

      expect(Company.with_modern_plan).to include(abc, penelope)
    end
  end

  describe ".not_trialing" do
    it "returns a list of companies that are not trialing" do
      penelope = Company.create!(name: "Penelope's", plan_level: "enterprise", trial_status: 2.days.from_now)
      abc = Company.create!(name: "ABC's", plan_level: "basic", trial_status: 5.days.from_now)
      zebra = Company.create!(name: "Zebra Company", plan_level: "legacy", trial_status: 2.days.ago)

      expect(Company.not_trialing.length).to eq(1)
    end
  end

  describe ".created_last_month" do
    it "returns a list of companies created last month" do
      penelope = Company.create!(name: "Penelope's", plan_level: "enterprise", trial_status: 2.days.from_now, created_at: 1.month.ago)
      abc = Company.create!(name: "ABC's", plan_level: "basic", trial_status: 5.days.from_now, created_at: 2.months.ago)
      zebra = Company.create!(name: "Zebra Company", plan_level: "legacy", trial_status: Time.current)

      expect(Company.created_last_month).to include(penelope)
    end
  end
end