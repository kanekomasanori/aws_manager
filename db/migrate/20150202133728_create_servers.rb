class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :instance_id
      t.string :name
      t.string :description
      t.boolean :shutdown, default: false

      t.timestamps null: false
    end
  end
end
