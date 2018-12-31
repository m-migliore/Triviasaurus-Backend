class Api::V1::RoundsController < ApplicationController
  before_action :find_round, only: [:update]
  def index
    @rounds = Round.all
    render json: @rounds
  end

  def create
    @round = Round.create(round_params)
    @round.save
    render json: @round , status: :accepted
  end

  def update
    @round.update(round_params)
    if @round.save
      render json: @round, status: :accepted
    else
      render json: { errors: @round.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def round_params
    params.permit(:game_id, :category, :difficulty, :question, :correct_answer, :incorrect_answer_1, :incorrect_answer_2, :incorrect_answer_3, :answer, :correct)
  end

  def round_game
    @round = Round.find(params[:id])
  end
end
