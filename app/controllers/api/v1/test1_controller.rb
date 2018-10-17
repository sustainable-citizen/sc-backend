module Api::V1
  class Test :: TestController < ::Api::ApiController
    def show
      render json: {errors:"test"}
    end
  end
end
