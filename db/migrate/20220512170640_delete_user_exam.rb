class DeleteUserExam < ActiveRecord::Migration[6.1]
  def change
    remove_column :exams, :user_id
  end
end
