class AddStartReservationToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :startreservation, :datetime
  end
end
