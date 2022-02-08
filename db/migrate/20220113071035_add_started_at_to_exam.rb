class AddStartedAtToExam < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :started_at, :datetime
  end
end