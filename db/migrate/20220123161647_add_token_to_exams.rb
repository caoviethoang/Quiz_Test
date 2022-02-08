class AddTokenToExams < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :token, :string
    add_index  :exams, :token
  end
end
