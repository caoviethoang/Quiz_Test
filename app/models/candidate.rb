class Candidate < ApplicationRecord
  validates :name, presence: true
  
  has_and_belongs_to_many :exams

  accepts_nested_attributes_for :exams
end