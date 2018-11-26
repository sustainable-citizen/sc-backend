class Api::V1::ChallengesController < ApplicationController
  before_action :doorkeeper_authorize!  #, except: [:index, :show]
  before_action :set_challenge, only: [:show, :update, :destroy]

  # GET /samples
  def index
    @challenge = Challenge.all
    json_response(@challenge)
  end

  # POST /samples
  def create
    @challenge = Challenge.create!(challenge_params)
    json_response(@challenge, :created)
  end

  # GET /samples/:id
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
    params.permit(:title)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
