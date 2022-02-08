class Category < ApplicationRecord
    has_many :questions

    validates :title, presence: true, uniqueness: true
    
end