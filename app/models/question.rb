class Question < ApplicationRecord
  validates :title, presence: true

  belongs_to :category
  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers, allow_destroy: true

end