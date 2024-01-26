class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.integer :hours_requested
      t.date :date_of_service
      t.decimal :total_cost

      t.timestamps
    end
  end
end
