class NewrelicServer < Newrelic

	def self.request_metrics(nr)
    JSON.parse(ServiceAbstract.get_request(ServiceAbstract.newrelic_uri("https://api.newrelic.com/api/v1/accounts/#{nr.account_id}/agents/#{nr.app_id}/metrics.json")))
  end
end