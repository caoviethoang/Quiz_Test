class ChangeType < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :type, :kind
  end
end
