json.access_token @designer.designer_auths.last.access_token
json.designer do
  json.id @designer.id
  json.email @designer.email
  json.password @designer.password
  json.nickname @designer.nickname
  json.image do
    json.id @designer.image.image_id
    json.file_name @designer.image.image_file_name
    json.file_content_type @designer.image.image_content_type
    json.file_size @designer.image.image_file_size
    json.file_updated_at @designer.image.image_updated_at
    json.large_url @designer.image.image.url(:large)
    json.medium_url @designer.image.image.url(:medium)
    json.thumb_url @designer.image.image.url(:thumb)
    json.original_url @designer.image.image.url
  end
end