class Exam < ApplicationRecord
  has_many :results

  accepts_nested_attributes_for :results
end