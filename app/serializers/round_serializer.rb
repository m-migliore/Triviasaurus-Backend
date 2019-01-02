class RoundSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :category, :difficulty, :question, :correct_answer, :incorrect_answer_1, :incorrect_answer_2, :incorrect_answer_3, :answer, :correct
  belongs_to :game
end
