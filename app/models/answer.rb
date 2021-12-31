class Answer < ApplicationRecord
  validates :title, length: { maximum: 200 }

  belongs_to :question
  belongs_to :result, optional: true
end