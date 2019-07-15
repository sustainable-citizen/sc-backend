class Api::V1::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :update, :destroy]

  # GET /challenges
  def index
    @challenges = Challenge.all
    json_response(@challenges)
  end

  # POST /challenges
  def create
    @challenge = Challenge.create!(challenge_params)
    json_response(@challenge, :created)
  end

  # GET /challenges/:id
  def show
    json_response(@challenge)
  end

  # PUT /samples/:id
  def update
    @challenge.update(challenge_params)
    head :no_content
  end

  # DELETE /samples/:id
  def destroy
    @challenge.destroy
    head :no_content
  end

  private

  def challenge_params
    # whitelist params
    params.permit(:name, :description, :start_date, :end_date)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
