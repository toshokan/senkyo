class CreatePersonAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :person_answers do |t|
      t.string :qid
      t.string :user
    end

    add_index :person_answers, [:qid, :user], unique: true
  end
end
