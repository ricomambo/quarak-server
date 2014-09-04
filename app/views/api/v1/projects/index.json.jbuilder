json.array!(@projects) do |project|
  json.extract! project, :id, :title
  json.members do
    json.array!(project.members) do |member|
      json.partial! 'user', user: member
    end
  end
end
