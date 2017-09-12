class Company < ApplicationRecord
  PLAN_LEVELS = %w(legacy custom basic plus growth enterprise)

  validates :plan_level, inclusion: { in: PLAN_LEVELS}

  enum plan_level: PLAN_LEVELS

  def self.sort_alphabetically
    order(:name)
  end

  def self.with_modern_plan
    where.not(plan_level: ["legacy", "custom"])
  end

  def self.not_trialing
    where("trial_status < ?", Time.current)
  end

  def self.created_last_month
    where("created_at > ? AND created_at < ?", Date.today.last_month.beginning_of_month, Date.today.beginning_of_month )
  end
end