class Datapoint < ActiveRecord::Migration
  def up
  	create_table :datapoints do |t|
  		t.float	:value
  		t.integer :time_range_id
  		t.integer :field_id
  		t.integer :metric_id
  	end
  end

  def down
  	drop_table :datapoints
  end
end
