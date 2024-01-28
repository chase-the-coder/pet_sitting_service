class RemoveTotalCostFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :total_cost, :decimal
  end
end
