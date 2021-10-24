class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :entry
      t.string :ticket
      t.belongs_to :question
    end
  end
end
