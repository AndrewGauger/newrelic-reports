class CreateNewrelics < ActiveRecord::Migration
  def change
    create_table :newrelics do |t|
      t.string :api_key
      t.string :account_id
      t.string :app_id
      t.string :name

      t.timestamps
    end
  end
end
