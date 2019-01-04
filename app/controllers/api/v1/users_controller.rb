class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :stats]
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    @user.save
    render json: @user , status: :accepted
  end

  def show
    render json: @user , status: :accepted
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def stats
    @userStats = {
      id: @user.id,
      username: @user.username,
      totalStats: @user.totalStats,
      categoryStats: @user.categoryStats
    }
    render json: @userStats, status: :accepted
  end#

  def leaderboard
    case params[:order]
      when "elo"
        @sortedUsers = User.sortedUserList(:elo)
      when "wins"
        @sortedUsers = User.sortedUserList(:wins)
      when "total"
        @sortedUsers = User.sortedUserList(:total)
      when "percentage"
        @sortedUsers = User.sortedUserList(:winPercentage)
    end
    # @sortedUsers = {
    #   elo: User.sortedUserList(:elo),
    #   wins: User.sortedUserList(:wins),
    #   total: User.sortedUserList(:total),
    #   percentage: User.sortedUserList(:winPercentage)
    # }
    render json: @sortedUsers, status: :accepted
  end

  private

  def user_params
    params.permit(:username)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
