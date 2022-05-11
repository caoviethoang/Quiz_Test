class Question < ApplicationRecord
  enum kind: { single: 0, multiple: 1, text: 2}

  belongs_to :category
  has_many :answers, dependent: :destroy
  has_one_attached :image
  
  validates :title, presence: true
  
  accepts_nested_attributes_for :answers, allow_destroy: true

end