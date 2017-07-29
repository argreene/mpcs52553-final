class Client < ApplicationRecord

  validates :client_name, presence: true
  validates :client_contact, presence: true
  validates :password_digest, presence: true

  has_many :orders,class_name: "Orders", foreign_key: :client_id

  has_secure_password

  #
end
