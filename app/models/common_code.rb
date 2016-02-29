class CommonCode < ApplicationRecord
  def self.find_by_common_code(main_code, detail_code)
    find_by_common_code_type(main_code).find_by_common_code_detail_id(detail_code)
  end

  def self.find_by_common_code_type(main_code)
    where(main_code: main_code)
  end

  def self.find_by_common_code_detail_id(detail_code)
    where(detail_code: detail_code)
  end
end