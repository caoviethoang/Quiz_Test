class Exam < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :questions

  accepts_nested_attributes_for :results, allow_destroy: true
end