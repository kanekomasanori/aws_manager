class AddIndexUniqueServersInstanceId < ActiveRecord::Migration
  def change
    add_index :servers, :instance_id, :unique => true
  end
end
