class AddUserExam < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :user_id, :integer
  end
end
