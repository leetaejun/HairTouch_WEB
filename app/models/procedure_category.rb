class ProcedureCategory < ApplicationRecord
  belongs_to :procedure
  has_many :procedure_details
end
