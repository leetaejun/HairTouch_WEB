class Procedure < ApplicationRecord
  belongs_to :designer
  has_many :procedure_details
end
