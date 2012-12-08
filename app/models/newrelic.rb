class Newrelic < ServiceAbstract
  #TODO: move time fields to new model
  attr_accessible :account_id, :api_key, :app_id, :name
  has_one :time_range, :as => :timed
  has_many :metrics
  has_many :fields

  @@format = "json"
  @@limit = 12000


  def request_metrics(scope = nil)
    parm = scope.nil? ?  {"limit" => @@limit} : {"limit" => @@limit , "re" => scope + "/*"} 
    JSON.parse(get_request(newrelic_uri("https://api.newrelic.com/api/v1/applications/#{app_id}/metrics.#{@@format}", parm)))
  end

  def request_deploys(page = 1)
    JSON.parse(get_airbrake(URI("https://rejuvenation.airbrake.io/projects/65570/deploys.json?auth_token=d5ee22f1923fa02f12daaf64bba843d5202b9f8c&page=#{page}")))
  end

  def begin_time; self.time_range.start_time.xmlschema; end
  def end_time; self.time_range.end_time.xmlschema; end


  def self.load_with_name(named)
  	return Newrelic.where({:name => named}).first
  end

  def self.rejuvenation
    return Newrelic.find_by_name("rejuvenation")
  end

  def request_server_metrics()
    JSON.parse(get_request(newrelic_uri("https://api.newrelic.com/api/v1/accounts/#{account_id}/agents/#{app_id}/metrics.json")))
  end

  def request_servers
    JSON.parse(get_request(newrelic_uri("https://api.newrelic.com/api/v1/accounts/#{account_id}/servers.json")))
  end
  
end