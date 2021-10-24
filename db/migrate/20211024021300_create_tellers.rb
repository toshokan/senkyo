class CreateTellers < ActiveRecord::Migration[6.1]
  def change
    create_table :tellers do |t|
      t.belongs_to :question
      t.string :user
    end
  end
end
