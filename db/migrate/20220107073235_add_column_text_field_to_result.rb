class AddColumnTextFieldToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :textfield, :text, null: true
  end
end
