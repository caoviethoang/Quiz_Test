class Candidate < ApplicationRecord
  has_and_belongs_to_many :exams
  
  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :exams,  allow_destroy: true
end