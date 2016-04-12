json.array!(@monsters) do |monster|
  json.extract! monster, :id, :name, :hp
  json.url monster_url(monster, format: :json)
end
