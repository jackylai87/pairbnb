class AddMainImageToListing < ActiveRecord::Migration
  def change
    add_column :listings, :main_image, :string
  end
end
