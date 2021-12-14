class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.string :type
      t.references :category,index:true, null: false, foreign_key: true

      t.timestamps
    end
    add_index :questions, [:category_id, :created_at]
  end
end
