class Provider < ApplicationRecord

  validates :provider_name, presence: true
  validates :description, length: { minimum: 10 }

  validates :rate, presence: true, numericality: { greater_than: 0 }

  has_many :orders, class_name: "Orders", foreign_key: :provider_id

  has_secure_password

end
