class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      user.regenerate_token
      render json: { token: user.token }
    else
      render_unauthorized('Error with your login or password')
    end
  end

  def destroy
    logout
    head :ok
  end

  private

  def logout
    if current_user
      current_user.invalidate_token
    end
  end
end