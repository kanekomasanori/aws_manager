class CreateAccountRegions < ActiveRecord::Migration
  def change
    create_table :account_regions do |t|
      t.integer :account_id
      t.string :region, null: false, default: 'ap-northeast-1'

      t.timestamps null: false
    end
  end
end
