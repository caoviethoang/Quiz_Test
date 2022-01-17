class Exam < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :questions
  has_and_belongs_to_many :candidates
  
  accepts_nested_attributes_for :results, allow_destroy: true

  def remaining_time
    return unless started_at
    (started_at + 30.minutes - Time.zone.now).to_i
  end
end