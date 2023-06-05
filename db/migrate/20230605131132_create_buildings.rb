class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :name
      t.integer :beds
      t.integer :price
      t.string :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
