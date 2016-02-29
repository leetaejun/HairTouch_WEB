class Designer < ApplicationRecord
  has_one :image, as: :imageable
  has_many :designer_auths

  def self.available_email(email)
    find_by(email: email).nil? if email.present?
  end

  def self.existed_designer(email, password)
    find_by(email: email, password: password) if (email && password).present?
  end
end