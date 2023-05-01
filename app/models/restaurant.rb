class Restaurant < ApplicationRecord

    has_one_attached :photo
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :description, presence: true, uniqueness: { case_sensitive: false }
    validates :address, presence: true, uniqueness: { case_sensitive: false }
    validates :city, presence: true, uniqueness: { case_sensitive: false }

end
