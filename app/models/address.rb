class Address < ApplicationRecord
  belongs_to :userable, polymorphic: true

  def self.most_recent
    order(updated_at: :desc).last
  end
end
