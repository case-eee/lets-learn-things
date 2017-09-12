class Company < ApplicationRecord
  PLAN_LEVELS = %w(legacy custom basic plus growth enterprise)

  validates :name, presence: true
  validates :plan_level, inclusion: { in: PLAN_LEVELS}

  enum plan_level: PLAN_LEVELS
end