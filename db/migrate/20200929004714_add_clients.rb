class AddClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :division
      t.integer :major_group
      t.integer :industry_group
      t.integer :sic
      t.string :description
      t.timestamps
    end
  end
end
