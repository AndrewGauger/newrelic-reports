class FieldNewrelicAssociation < ActiveRecord::Migration
  def up
  	add_column :fields, :newrelic_id, :integer
  end

  def down
  	remove_column :fields, :newrelic_id, :integer
  end
end
