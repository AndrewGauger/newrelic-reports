class Analysis < ServiceAbstract
  attr_accessible :name
  has_many :profiles

  def self.create_weekly(range, fm, name)
  	analysis = Analysis.new(:name => name)
  	cursor = range.start_time.clone
  	while (cursor < range.end_time)
  		p = Profile.create(:name => name + cursor.to_s, :field_metric_id => fm.id)
		 	p.time_range = TimeRange.from(cursor, cursor + 7.days)
		 	analysis.profiles << p
			cursor += 7.days
		end
		analysis.save
		analysis
	end

	def self.create_deployed(fm, name)
		analysis = Analysis.new(:name => name)
		beginning = nil
		DeployHistory.all.each do |dep|
			if beginning.nil?
				p = Profile.create(:name => name + dep.at.to_s, :field_metric_id => fm.id)
				p.time_range = TimeRange.from(Time.parse(beginning), Time.parse(at))
				analysis.profiles << p
			end
			begining = dep.at
		end
	end


end
