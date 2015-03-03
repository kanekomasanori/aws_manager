class CreateAccountRegions < ActiveRecord::Migration
  def change
    create_table :account_regions do |t|
      t.integer :account_id
      t.integer :region_code

      t.timestamps null: false
    end
  end
end
