class Reservation < ApplicationRecord

    validates :mesa, presence: true, uniqueness: { case_sensitive: false }

    belongs_to :restaurant
    
end
