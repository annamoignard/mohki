class AddDescriptionToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :description, :string
  end
end
