class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :result, optional: true
  
  validates :title, length: { maximum: 200 }

  scope :corrected, -> { where corrected: true }

end