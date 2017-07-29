class Orders < ApplicationRecord

  validates :client_id, presence: true
  validates :provider_id, presence: true

  belongs_to :provider
  belongs_to :client

end
