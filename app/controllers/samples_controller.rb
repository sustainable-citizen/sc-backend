class SamplesController < ApplicationController
  before_action :doorkeeper_authorize!  #, except: [:index, :show]
  before_action :set_sample, only: [:show, :update, :destroy]

  # GET /samples
  def index
    @samples = Sample.all
    json_response(@samples)
  end

  # POST /samples
  def create
    @sample = Sample.create!(sample_params)
    json_response(@sample, :created)
  end

  # GET /samples/:id
  def show
    json_response(@sample)
  end

  # PUT /samples/:id
  def update
    @sample.update(sample_params)
    head :no_content
  end

  # DELETE /samples/:id
  def destroy
    @sample.destroy
    head :no_content
  end

  private

  def sample_params
    # whitelist params
    params.permit(:title)
  end

  def set_sample
    @sample = Sample.find(params[:id])
  end
end