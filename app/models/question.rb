class Question < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }

  belongs_to :category
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
end
