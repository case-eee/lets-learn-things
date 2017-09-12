require "rails_helper"

describe Company do
  context "validations" do
    it { is_expected.to define_enum_for(:plan_level).with([:legacy, :custom, :basic, :plus, :growth, :enterprise]) }
  end
end