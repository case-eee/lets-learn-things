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
end