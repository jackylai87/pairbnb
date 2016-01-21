class AddSubImageOneToListing < ActiveRecord::Migration
  def change
    add_column :listings, :sub_image_one, :string
  end
end
