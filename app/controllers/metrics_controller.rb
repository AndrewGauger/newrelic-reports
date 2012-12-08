class MetricsController < ApplicationController



	#/metrics/new
	def new
		@counter = 0
		api = Newrelic.find_by_name("rejuvenation")
		api.request_metrics().each do |met|
			api.metrics <<  Metric.find_or_create_by_name(met['name'])
			met['fields'].each do |fld|
				new_metric.fields << Field.find_or_create_by_name(fld)
				
			end
			new_metric.save
			@counter += 1
		end
		render :inline => "got #{@counter} metrics"
	end


end
