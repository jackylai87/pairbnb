class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accomodate
      t.string :location
      t.text :description

      t.timestamps null: false
    end
  end
end
