class Api::V1::UserChallengeController < ApplicationController
  before_action :doorkeeper_authorize!  #, except: [:index, :show]
  before_action :set_user_challenge, only: [:show, :update, :destroy]

  # GET /user_challenges
  def index
    @user_challenges = UserChallenge.all

    if params[:user_id]
      @user_challenges = UserChallenge.where(user_id: params[:user_id])
    end

    if params[:challenge_id]
      @user_challenges = UserChallenge.where(challenge_id: params[:challenge_id])
    end
    json_response(@user_challenges)
  end

  # POST /user_challenges
  def create
    @user_challenge = UserChallenge.create!(user_challenge_params)
    json_response(@user_challenge, :created)
  end

  # GET /user_challenges/:id
  def show
    json_response(@user_challenge)
  end

  # PUT /user_challenges/:id
  def update
    @user_challenge.update(user_challenge_params)
    head :no_content
  end

  # # DELETE /user_challenges/:id
  # def destroy
  #   @user_challenge.destroy
  #   head :no_content
  # end

  private

  def user_challenge_params
    # whitelist params
    params.permit(:user_id, :challenge_id, :accept_date, :status_id)
  end

  def set_user_challenge
    @user_challenge = UserChallenge.find(params[:id])
  end
end
