class Orders < ApplicationRecord

  belongs_to :provider
  belongs_to :client

end
