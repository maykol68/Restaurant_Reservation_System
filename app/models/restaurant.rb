class Restaurant < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        name: 'A',
        description: 'B'
    }
    
    has_one_attached :photo
    
    has_many :reservations, dependent: :restrict_with_exception
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :description, presence: true, uniqueness: { case_sensitive: false }
    validates :address, presence: true, uniqueness: { case_sensitive: false }
    validates :city, presence: true

    
end
