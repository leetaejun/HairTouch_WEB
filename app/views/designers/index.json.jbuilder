json.array!(@designers) do |designer|
  json.extract! designer, :id, :email, :password, :nickname
  json.url designer_url(designer, format: :json)
end
