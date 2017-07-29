class Provider < ApplicationRecord

  validates :provider_name, presence: true
  validates :provider_contact, presence: true
  validates :description, length: { minimum: 10 }
  validates :provider_address, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validates :password_digest, presence: true

  has_many :orders, class_name: "Orders", foreign_key: :provider_id

  has_secure_password

end
