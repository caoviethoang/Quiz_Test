class CreateTableCandidatesExams < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates_exams, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :exam
    end
  end
end
