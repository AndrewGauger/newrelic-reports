class Profile < ServiceAbstract
	attr_accessible :name, :field_metric_id
	has_many :data_points, :include => :time_range, :order => "time_ranges.start_time"
	belongs_to :field_metric
	belongs_to :analysis
	has_one :metric, :through => :field_metric
	has_one :field, :through => :field_metric
	has_one :time_range, :as => :timed
	has_one :newrelic, :through => :field

	def load_data
		data_points << DataPoint.parse_array(JSON::parse(get_data))
	end

  def get_data()
	get_request(newrelic_uri(
		"https://api.newrelic.com/api/v1/accounts/#{metric.newrelic.account_id}/metrics/data.json",
		{'app_id' => metric.newrelic.app_id,
		'begin' => time_range.start_time.xmlschema , 'end' => time_range.end_time.xmlschema, 'metrics' => metric.name,
		'field' => field.name}))
	end

	def time_value
		data_points.map{|pt| Hash.new(:time => pt.time_range.start_time, :data => pt.value)}
	end

	def time_value_plot
		data_points.map{|pt| Array.new(pt.time_range.start_time.since(time_range.begin_time), pt.value)}
	end

	def average
		data_points.average
	end

	def max
		data_points.max
	end

end
