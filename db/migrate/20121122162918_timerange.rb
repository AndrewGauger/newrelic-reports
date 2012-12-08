class Timerange < ActiveRecord::Migration
  def up
  	create_table :timeranges do |t|
	  	t.datetime :start_time
	  	t.datetime :end_time
	  end
	  add_column :newrelics, :time_range_id, :integer
	    	remove_column :newrelics, :start
  	remove_column :newrelics, :complete
  end

  def down
  	drop_table :timeranges
  end
end
