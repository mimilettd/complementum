class Policy < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :carrier, optional: true
end
