class AddMarkToCandidate < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :mark, :float
  end
end
