class AddIndexesToRounds < ActiveRecord::Migration[5.2]
  def change
    add_index :rounds, :correct
    add_index :rounds, :category
    add_index :rounds, :difficulty
  end
end
