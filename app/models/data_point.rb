class DataPoint < ServiceAbstract
	belongs_to :field_metric
	belongs_to :profile
	has_one :time_range, :as => :timed
	attr_accessible :value

	def self.create_with_json(data)
		#puts data.inspect
		raise "Field does not exist" unless field_name = (data.keys & Field::names).pop 
		dp = DataPoint.new
		dp.field_metric = FieldMetric.field_metric(Field.find_by_name(field_name), Metric.find_by_name(data['name']))
		dp.time_range = TimeRange.from(data["begin"], data["end"])
		dp.value = data[field_name]
		dp.save
		return dp
	end
	def to_f
		value
	end
	def to_s
		value.to_s
	end

	def self.parse_array(json_arr)
		return_array = Array.new
		json_arr.each do |data|
			puts data.inspect
			return_array << DataPoint.create_with_json(data)
		end
		return return_array
	end


end
