class AddSubImageTwoToListing < ActiveRecord::Migration
  def change
    add_column :listings, :sub_image_two, :string
  end
end
