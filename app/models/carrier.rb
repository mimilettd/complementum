class Carrier < ApplicationRecord
 has_many :addresses, as: :userable
 has_many :policies
 has_many :clients, through: :policies
end
