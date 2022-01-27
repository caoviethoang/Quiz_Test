class AddStatusToExams < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :status, :integer, default: 0
  end
end
