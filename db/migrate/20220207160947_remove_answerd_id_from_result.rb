class RemoveAnswerdIdFromResult < ActiveRecord::Migration[6.1]
  def change
    remove_column :results, :anwser_id
  end
end
