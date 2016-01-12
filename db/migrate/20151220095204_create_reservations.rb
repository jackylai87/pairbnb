class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :check_in_date
      t.string :check_out_date
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
