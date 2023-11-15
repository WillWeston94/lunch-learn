class Api::V1::SessionsController < ApplicationController
  def create
    request = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(email: request[:email])
    if user && user.authenticate(request[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Invalid email or password" }, status: 400
    end
  end
end
