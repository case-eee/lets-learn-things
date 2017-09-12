require "rails_helper"

describe Lesson do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }

    it "only allows letters and numbers in the name" do
    	company = Company.create(name: "Penelope's Shop", plan_level: "legacy")
    	lesson = Lesson.new(name: "12xc12", company: company)
    	expect(lesson).to be_valid
    end

    it "does not allow special characters in the name" do
    	company = Company.create(name: "Penelope's Shop", plan_level: "legacy")
    	lesson = Lesson.new(name: "@12x@c12", company: company)
    	expect(lesson).to be_invalid
    end

    it "does not allow white spaces in the name" do
    	company = Company.create(name: "Penelope's Shop", plan_level: "legacy")
    	lesson = Lesson.new(name: "@12  c12", company: company)
    	expect(lesson).to be_invalid
    end
  end

  context "associations" do
    it { is_expected.to belong_to(:company) }
  end
end