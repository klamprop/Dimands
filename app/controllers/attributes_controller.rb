class AttributesController < ApplicationController
  before_filter :signed_in_user
#  before_filter :id_owner,   only: [:new, :create, :destroy]

  def new
   @current_identity = Identity.find(params[:identity_id])
   @attribute = @current_identity.attributes.new
  end

  def create
  @current_identity = Identity.find(params[:identity_id])
  @attribute = @current_identity.attributes.build(params[:attribute])
    if @attribute.save
      flash[:success] = "Attribute registered!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @identity = current_user.identities.find(params[:identity_id])
    @identity.attributes.find(params[:id]).destroy
    flash[:success] = "Attribute successfully deleted."
    redirect_to current_user
  end


  private

#  def id_owner
#   @user ||= session[:remember_token] && User.find(session[:remember_token])
#   redirect_to(current_user) unless current_user?(@user)
 
#  end

end


