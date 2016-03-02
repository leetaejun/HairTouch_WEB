class ProcedureDetail < ApplicationRecord
  belongs_to :procedure_category
  has_one :image, as: :imageable
end
