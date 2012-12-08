class Weekly < Profile
	@field = nil

	def self.single_loader(start, metric, field)
		report = metric.fields.find(Field.find(field.id)).create_profile(:time_range => TimeRange.from(start, start.weeks_ago(-1)))
		#report.metrics << metric	#(metric.kind_of? String) ? Metric.find_by_name(metric) : metric
		#report.time_range = TimeRange.from(start, start.weeks_ago(-1))
		#report.fields <<  field #(field.kind_of? String) ? Field.find_by_name(field) : field
		#report.save
		#return report
	end

	def field=(value)
		@field = value
	end

end