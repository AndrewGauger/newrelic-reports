class DeployHistory < ServiceAbstract
#Airbrake API for deploy XML https://rejuvenation.airbrake.io/projects/60158/deploys.json
attr_accessible :at, :user, :rev, :url, :repo
belongs_to			:newrelic


	def self.get_history(api = Newrelic.rejuvenation)
		self.delete_all
		j = true
		page = 1
		while (j.present?)
			j = api.request_deploys(page)
			if j.present? 
				j['deploys'].each do |dep|
					 
						self.create({:at => dep['created_at'],
												:user => dep['local_username'],
												:rev => dep['scm_revision'],
												:url => dep['github_url'],
												:repo => dep['scm_repository']}) unless self.find_by_rev(dep['scm_revision'])
					
				end
				page += 1
			end
		end
		return self.all.count
	end

end