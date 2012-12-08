class TwoWordsTough < ActiveRecord::Migration
  def up
  	rename_table(:timeranges, :time_ranges)
  	rename_table(:datapoints, :data_points)
  end

  def down
  	rename_table(:time_ranges, :timeranges)
  	rename_table(:data_points, :datapoints)

  end
end
