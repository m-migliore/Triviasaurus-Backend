class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show, :update]
  def index
    @games = Game.all
    render json: @games
  end

  def show
    render json: @game , status: :accepted
  end

  def create
    @game = Game.create(game_params)
    @game.save
    render json: @game , status: :accepted
  end

  def update
    @game.update(game_params)
    if @game.save
      render json: @game, status: :accepted
    else
      render json: { errors: @game.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def game_params
    params.permit(:user_id)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
