class AddColumnTextAnswerForResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :text_answer, :text, null: true
  end
end
