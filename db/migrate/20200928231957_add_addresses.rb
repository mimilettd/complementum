class AddAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.references :userable, polymorphic: true
      t.timestamps
    end
  end
end
