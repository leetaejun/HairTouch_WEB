class Designer < ApplicationRecord
  has_one :image, as: :imageable
end
