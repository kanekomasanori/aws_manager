class AddColumnServersTimeSet < ActiveRecord::Migration
  def change
    add_column :servers, :start_time, :string, limit: 5, default: '10:00', after: :shutdown
    add_column :servers, :stop_time, :string, limit: 5, default: '24:00', after: :start_time
  end
end
