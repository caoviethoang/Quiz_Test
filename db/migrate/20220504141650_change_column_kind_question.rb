class ChangeColumnKindQuestion < ActiveRecord::Migration[6.1]
  remove_column :questions, :kind
end
