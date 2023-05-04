class AddEndReservationToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :endreservation, :datetime
  end
end
