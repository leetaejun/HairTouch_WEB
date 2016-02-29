json.array! @common_codes do |comm_cd|
  json.main_code comm_cd.main_code
  json.detail_code comm_cd.detail_code
  json.detail_name comm_cd.detail_name
end