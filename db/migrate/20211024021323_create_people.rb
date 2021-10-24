class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.belongs_to :question
      t.string :user
    end
  end
end
