class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :results
  
  validates :title, length: { maximum: 200 }

  scope :corrected, -> { where corrected: true }

end