class Field < ServiceAbstract
  attr_accessible :name, :field_id
  has_one :field_metric
  has_many :metrics, :through => :field_metric
  belongs_to :newrelic

  before_create :associate_newrelic

  validates_uniqueness_of :name

  	def api_key; self.newrelic.api_key; end

  	def associate_newrelic
  		self.newrelic = self.metrics.first.newrelic
  	end

  	def self.names
  		Field.all.map(&:name)
  	end

end
