class AddKindToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :kind, :integer, default: 0
  end
end
