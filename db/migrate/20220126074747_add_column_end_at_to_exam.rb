class AddColumnEndAtToExam < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :end_at, :datetime
  end
end
