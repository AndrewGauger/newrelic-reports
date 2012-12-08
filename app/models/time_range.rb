class TimeRange < ServiceAbstract
	attr_accessible :start_time, :end_time
	belongs_to :timed , :polymorphic => true

	def self.from(starting, ending)
		TimeRange.create(:start_time => starting, :end_time => ending)
	end

	def self.eternity
		TimeRange.from(Time.gm(2012, 'sep', 14), Time.now)
	end

	def days
		((diff)/ (60 ** 2 * 24)).to_i
	end

	def hours
		((diff)/ (60 * 24)).to_i
	end

	def diff
		end_time - start_time 
	end

	def since(tr)
		self.start_time - tr.start_time
	end

end