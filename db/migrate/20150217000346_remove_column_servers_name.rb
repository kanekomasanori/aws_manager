class RemoveColumnServersName < ActiveRecord::Migration
  def change
    remove_column :servers, :name, :string
  end
end
