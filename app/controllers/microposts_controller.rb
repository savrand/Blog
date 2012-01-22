class MicropostsController < ApplicationController

  def create
  @user = User.find(params[:user_id])
    @micropost  = @user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
   redirect_to @user
      
    else
      render 'pages/home'
    end
  end

  def destroy
  end

end
