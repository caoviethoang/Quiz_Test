class AddResultIdToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :result_id, :integer
  end
end
