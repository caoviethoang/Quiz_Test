class AddLastNameToCandidate < ActiveRecord::Migration[6.1]
  def change
    rename_column :candidates, :name, :first_name
    add_column :candidates, :last_name, :string
  end
end
