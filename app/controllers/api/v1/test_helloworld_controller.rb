class Api::V1::TestHelloworldController < ApplicationController
  def show
    render :json => {:message => "Hello world"}
  end
end
