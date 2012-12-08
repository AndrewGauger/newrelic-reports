class ExtendNewrelic < ActiveRecord::Migration
  def up
  	add_column :newrelics, :start, :datetime
  	add_column :newrelics, :complete, :datetime
  end

  def down
  	remove_column :newrelics, :start
  	remove_column :newrelics, :complete
  end
end
