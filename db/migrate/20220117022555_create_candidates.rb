class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.timestamps
    end

    create_table :candidates_exams, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :exam
    end
  end
end