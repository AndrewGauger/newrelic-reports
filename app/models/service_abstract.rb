class ServiceAbstract < ActiveRecord::Base

	self.abstract_class = true

	require 'net/https'


#Generally called with get_request(newrelic_url("http://api.newrelic.com/api/v1", {attribute => value}))
	def get_request(uri)
		http_connection = open_socket uri
    @request = Net::HTTP::Get.new(uri.request_uri)
    @request.add_field("x-api-key" , newrelic.api_key)    
    @response = http_connection.request @request 
    @response.body
   end

   def get_airbrake(uri)
      http_connection = open_socket uri
      @request = Net::HTTP::Get.new(uri.request_uri)
      @response = http_connection.request @request 
      @response.body
    end

   #TODO get_requests(uris)

		#set up socket to connect to New Relic REST API
	def open_socket(uri)
   	http_connection = Net::HTTP.new(uri.hostname, uri.port)
		http_connection.use_ssl = true
		http_connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
		http_connection
	end

  def newrelic_uri(request, params = {})
  	querystring = '?'
  	params.each do |parm, value|
  		if (value.kind_of?(Array))
  			value.each do |val|
  				querystring << URI.escape(parm.to_s + "[]=" + val.to_s + '&')
  			end
  		else
  			querystring << URI.escape(parm.to_s + '=' + value.to_s + '&')
  		end
  	end
  	return (URI.join(request, querystring.chop))
  end

end