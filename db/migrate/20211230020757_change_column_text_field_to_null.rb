class ChangeColumnTextFieldToNull < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :textfield, :text, null: true
  end
end