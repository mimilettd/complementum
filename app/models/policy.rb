class Policy < ApplicationRecord
  belongs_to :userable, polymorphic: true
  belongs_to :client
  belongs_to :carrier
end
