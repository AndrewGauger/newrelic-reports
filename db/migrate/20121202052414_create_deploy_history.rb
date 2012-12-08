class CreateDeployHistory < ActiveRecord::Migration
  def up
  	create_table 	:deploy_histories do |t|
  		t.datetime 	:at
  		t.string		:rev
  		t.string		:user
  		t.string		:url
      t.string    :repo
      t.integer   :newrelic_id
  	end
  end

  def down
  	drop_table 	:deploy_histories
  end
end
