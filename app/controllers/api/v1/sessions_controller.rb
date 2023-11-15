class Api::V1::SessionsController < ApplicationController
  def create
    body = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(email: body[:email])
    if user && user.authenticate(body[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: "Invalid email or password" }, status: 400
    end
  end
end
