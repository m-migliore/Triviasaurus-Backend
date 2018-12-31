class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.string :category
      t.string :difficulty
      t.string :question
      t.string :correct_answer
      t.string :incorrect_answer_1
      t.string :incorrect_answer_2
      t.string :incorrect_answer_3
      t.string :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
