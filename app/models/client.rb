class Client < ApplicationRecord

  validates :client_name, presence: true
  validates :client_contact, presence: true

  has_many :orders

  has_secure_password

end
