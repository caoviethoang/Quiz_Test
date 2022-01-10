class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :answers, :iscorrected, :corrected
  end
end
