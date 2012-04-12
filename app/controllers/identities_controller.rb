class IdentitiesController < ApplicationController
  before_filter :signed_in_user
#  before_filter :id_owner,   only: [:new, :create, :destroy]

  def new
   @user = User.find(params[:user_id])
   @identity = @user.identities.new
  end

  def create
  @identity = current_user.identities.build(params[:identity])
    if @identity.save
      flash[:success] = "New identity registered!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    current_user.identities.find(params[:id]).destroy
    flash[:success] = "Identity successfully deleted."
    redirect_to current_user
  end

  def edit
   @user = User.find(params[:user_id])
   @identity = current_user.identities.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @identity = current_user.identities.find(params[:id])
    if @identity.update_attributes(params[:identity])
      flash[:success] = "Identity updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  private

#  def id_owner
#   @user ||= session[:remember_token] && User.find(session[:remember_token])
#   redirect_to(current_user) unless current_user?(@user)
 
#  end

end


