class Lesson < ApplicationRecord
	validates :name, presence: true
	validate :name_contains_only_letters_and_numbers
	belongs_to :company

	def name_contains_only_letters_and_numbers
		if !(self.name =~ /^[a-zA-Z0-9]+$/)
			errors.add(:name_content, "must only include letters and numbers")
		end
	end
end