class ChangeColumnNameOfReusult < ActiveRecord::Migration[6.1]
  def change
    rename_column :results, :textfield, :text_answer
  end
end
