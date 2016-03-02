class ProcedureDetail < ApplicationRecord
  belongs_to :procedure
  has_one :image, as: :imageable
end