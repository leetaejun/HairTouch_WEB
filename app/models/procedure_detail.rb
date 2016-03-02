class ProcedureDetail < ApplicationRecord
  belongs_to :procedure
  has_many :images, as: :imageable
end
