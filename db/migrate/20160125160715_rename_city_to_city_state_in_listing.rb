class RenameCityToCityStateInListing < ActiveRecord::Migration
  def change
  	rename_column :listings, :city, :city_state
  end
end
