class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :question
  has_and_belongs_to_many :answers
end