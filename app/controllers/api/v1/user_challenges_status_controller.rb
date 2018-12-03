class Api::V1::UserChallengesStatusController < ApplicationController
  before_action :set_user_challenges_status, only: [:destroy]

  # GET /user_challenges_status
  def index
    @user_challenges_statuses = UserChallengesStatus.all
    json_response(@user_challenges_statuses)
  end

  def show
  end

  def create
  end

  def update
  end

  # DELETE /user_challenges_status/:id
  def destroy
    @user_challenges_status.destroy
    head :no_content
  end

  private

  def set_user_challenges_status
    @user_challenges_status = UserChallengesStatus.find(params[:id])
  end
end
