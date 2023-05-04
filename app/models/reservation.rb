class Reservation < ApplicationRecord

    validates :mesa, presence: true, uniqueness: { case_sensitive: false }
    validates :startreservation, presence: true, uniqueness: { case_sensitive: false }
    validates :endreservation, presence: true

    belongs_to :restaurant
    
end
