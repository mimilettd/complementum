class Client < ApplicationRecord
 has_many :addresses, as: :userable
 has_many :policies
 has_many :carriers, through: :policies
end
