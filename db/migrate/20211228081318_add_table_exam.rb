class AddTableExam < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|

      t.timestamps
    end
  end
end