class Restaurant < ApplicationRecord

    has_one_attached :photo
    
    has_many :reservations, dependent: :restrict_with_exception
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :description, presence: true, uniqueness: { case_sensitive: false }
    validates :address, presence: true, uniqueness: { case_sensitive: false }
    validates :city, presence: true

    
end
