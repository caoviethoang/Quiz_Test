class CreateAnswersResultsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :answers, :results do |t|
      t.index :answer_id
      t.index :result_id
    end
  end
end
