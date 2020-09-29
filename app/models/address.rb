class Address < ApplicationRecord
  belongs_to :userable, polymorphic: true
end
