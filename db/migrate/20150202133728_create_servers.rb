class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.integer :account_id
      t.string :instance_id
      t.string :name
      t.string :description
      t.boolean :shutdown, default: false

      t.timestamps null: false
    end
  end
end
