class AddDefaultAnswerToRounds < ActiveRecord::Migration[5.2]
  def change
    change_column_default :rounds, :answer, nil
  end
end
