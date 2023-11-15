class Api::V1::UsersController < ApplicationController
  before_action :request, only: [:create]

  def create
    request = JSON.parse(request.body.read, symbolize_names: true)
      user = User.create(name: request[:name],
                        email: request[:email],
                        password: request[:password],
                        password_confirmation: request[:password_confirmation]
                        )  
    if user[:password] != user[:password_confirmation]
      render json: { error: "Passwords do not match. Please try again." }, status: 400
    elsif User.exists?(email: user[:email])
      render json: { error: "Email has already been taken. Please try a different email." }, status: 400
    elsif user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 400
    end
  end
end
