class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :price_range
      t.string :speciality
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
