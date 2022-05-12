class AddAccountToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account, :string
    add_column :users, :password, :string
  end
end
