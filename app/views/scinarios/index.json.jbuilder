json.array!(@scinarios) do |scinario|
  json.extract! scinario, :id, :name
  json.url scinario_url(scinario, format: :json)
end
