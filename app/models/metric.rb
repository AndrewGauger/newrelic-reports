class Metric < ServiceAbstract
  # attr_accessible :title, :body
  attr_accessible :name, :metric_id
  belongs_to :newrelic
  has_many :field_metrics
  has_many :fields, :through => :field_metrics
  
  validates_uniqueness_of :name



  def get_data(field)
  		return get_request(newrelic_uri(
  			"https://api.newrelic.com/api/v1/accounts/#{self.newrelic.account_id}/metrics/data.json",
  			{'app_id' => self.newrelic.app_id,
  				'begin' => self.newrelic.begin_time , 'end' => self.newrelic.end_time, 'metrics' => [name],
  				'field' => field.name
  			}))
  end

  def api_key; self.newrelic.api_key; end

  def self.roots
  	Metric.all.map{|x| x.name.match(/.+?\//).to_s.chomp('/')}.uniq
  end

end
