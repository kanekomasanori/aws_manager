class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :user_arn, null: false
      t.string :user_name, null: false
      t.string :access_key_id, null: false
      t.string :secret_access_key, null: false

      t.timestamps null: false
    end
  end
end
