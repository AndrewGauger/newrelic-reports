class FieldsMetrics < ActiveRecord::Migration
	def change
		create_table :field_metrics do |t|
			t.integer :field_id
			t.integer :metric_id
		end
	end
end
