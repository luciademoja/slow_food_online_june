class Api::V0::PingController < Api::ApiController
  def index
     render json: {message: 'Pong'}
   end
end
