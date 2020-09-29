class AddPolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.belongs_to :client
      t.belongs_to :carrier
      t.string :category
      t.string :division
      t.date :effective_date
      t.date :expiration_date
      t.integer :written_premium
      t.integer :carrier_policy_number
      t.timestamps
    end
  end
end
