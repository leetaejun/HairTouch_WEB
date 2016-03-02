json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :designer_id, :hair_length_id, :hair_category_id, :title, :subtitle, :content
  json.url procedure_url(procedure, format: :json)
end
