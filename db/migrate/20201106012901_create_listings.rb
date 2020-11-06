class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true
      t.integer :price
      t.integer :eco_rating

      t.timestamps
    end
  end
end
