json.array!(@servers) do |server|
  json.extract! server, :id, :instance_id, :name, :description, :shutdown
  json.url server_url(server, format: :json)
end
