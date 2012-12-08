class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
    	t.string :name
    	t.integer :newrelic_id
      t.timestamps
    end
  end
end
