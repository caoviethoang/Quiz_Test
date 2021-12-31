class AddTableResult < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :anwser_id
      t.references :exam, index:true, null: false, foreign_key: true
      t.timestamps
    end
    add_index :results, [:question_id, :created_at]
    add_index :results, [:anwser_id, :created_at]
  end
end