class AddExamIdToCandidate < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :exam_id, :integer
  end
end
