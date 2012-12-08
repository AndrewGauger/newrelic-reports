class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.string :name

      t.timestamps

      add_column :profiles, :analysis_id, :integer
    end
  end
end
