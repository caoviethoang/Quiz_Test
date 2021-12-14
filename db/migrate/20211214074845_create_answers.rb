class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :title
      t.boolean :iscorrected
      t.references :question, index:true,null: false, foreign_key: true

      t.timestamps
    end
    add_index :answers, [:question_id, :created_at]
  end
end
