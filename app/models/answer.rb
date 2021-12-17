class Answer < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }

  belongs_to :question
end
