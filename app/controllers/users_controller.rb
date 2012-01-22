class UsersController < ApplicationController
   def show
    @user = User.find(params[:id])
    @micropost = Micropost.new
    @microposts = @user.microposts
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
    @users = User.all
  end
   
  def alluser
   @user = User.find(params[:id])
   @users = User.all
  end

  def follow
   @user = User.find(params[:id])
   @micropost=Micropost.where(user_id:[@user.following_ids])	
  end

  def create
    @user = User.new(params[:user])
    if @user.save
       redirect_to @user
      # Обработка успешного сохранения.
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def update
   @user = User.find(params[:current_user_id])
   @abc=User.find(params[:user_id])
   if @user.following_ids.include?(@abc.id)
     @user.relationships.find_by_followed_id(params[:user_id]).destroy
   else
     @user.relationships.create(:followed_id =>params[:user_id])
    end
 redirect_to :back
  end

end
