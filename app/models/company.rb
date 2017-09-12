class Company < ApplicationRecord
  PLAN_LEVELS = %w(legacy custom basic plus growth enterprise)

  validates :plan_level, inclusion: { in: PLAN_LEVELS}

  enum plan_level: PLAN_LEVELS

  def self.sort_alphabetically
    order(:name)
  end
end