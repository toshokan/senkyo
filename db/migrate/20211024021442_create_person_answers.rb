class CreatePersonAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :person_answers do |t|
      t.string :qid
      t.string :user
    end
  end
end
