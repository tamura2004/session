json.array!(@pc_skills) do |pc_skill|
  json.extract! pc_skill, :id
  json.url pc_skill_url(pc_skill, format: :json)
end
