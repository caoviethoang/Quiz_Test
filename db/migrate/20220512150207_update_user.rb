class UpdateUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :exam_id, :integer
  end
end
