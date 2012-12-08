class Timed < ActiveRecord::Migration
  def up
  	remove_column :newrelics, :time_range_id
  	remove_column :datapoints, :time_range_id
  	add_column :timeranges, :timed_id, :integer
  	add_column :timeranges, :timed_type, :string
  end

  def down
  end
end
