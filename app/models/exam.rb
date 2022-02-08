class Exam < ApplicationRecord
  enum status: [:in_progess, :finished]

  attr_accessor :question_ids

  has_many :results, dependent: :destroy
  has_many :questions
  has_and_belongs_to_many :candidates
  
  before_create :generate_token
  
  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :results, allow_destroy: true

  def remaining_time
    return unless started_at
    (started_at + Settings.shared.test_time.minutes - Time.zone.now).to_i
  end

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64
  end

  def to_param
    token
  end

end