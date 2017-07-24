class Provider < ApplicationRecord

  validates :provider_name, presence: true
  validates :description, length: { minimum: 10 }

  validates :rate, presence: true, numericality: { greater_than: 0 }

end
