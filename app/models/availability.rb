class Availability < ApplicationRecord
  belongs_to :user

	def self.options_for_select
  		order('LOWER(start_time)').map { |e| [e.start_time, e.id] }
	end
end
