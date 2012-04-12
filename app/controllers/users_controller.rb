class UsersController < ApplicationController

 before_filter :signed_in_user, only: [:index, :show, :edit, :update]
 before_filter :correct_user,   only: [:show, :edit, :update]
 before_filter :admin_user,     only: [:index]

  def show
   @user = User.find(params[:id]) 
   @identities = @user.identities
   @identities = @user.identities.paginate(page: params[:page], :per_page => 6)
#    @user = User.find_by_username(params[:user][:username])  
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to DIMANDS!"
      redirect_to @user
    else
      render 'new'
    end
  end
 
  def edit
  end

#  def idreg
#  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

 def correct_user
 @user = User.find(params[:id])
 redirect_to(current_user) unless current_user?(@user)
 end
   
   def admin_user
      redirect_to current_user, notice: "Not Authorized." unless current_user.admin 
    end
end
