json.array!(@pcs) do |pc|
  json.extract! pc, :id, :name
  json.url pc_url(pc, format: :json)
end
