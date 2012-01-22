class SessionsController < ApplicationController
  def new
   @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:name],
                             params[:session][:email])
    if user.nil?
      flash.now[:error] = "Invalid name/email combination."
      @title = "Sign in"
      render 'new'
    else
      redirect_to user
    end
  end

  def destroy
  end
end

