class RenameEndAtInExam < ActiveRecord::Migration[6.1]
  def change
    rename_column :exams, :end_at, :ended_at
  end
end
