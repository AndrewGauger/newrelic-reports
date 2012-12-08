class Profiles < ActiveRecord::Migration
  def up
  	create_table :profiles do |t|
  		t.string		:name
  		t.string		:type
      t.integer   :field_metric_id
  	end
  	add_column :data_points, :profile_id, :integer
    add_column :data_points, :field_metric_id, :integer
  	
  end

  def down
  	drop_table :profiles
  	drop_table :metric_profiles
  end
end
