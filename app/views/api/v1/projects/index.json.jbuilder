json.array!(@projects) do |project|
  json.extract! project, :id, :title
  json.members do
    json.array!(project.members) do |member|
      json.id member.id
      json.name member.name
    end
  end
end
