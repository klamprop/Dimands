module SessionsHelper
 def sign_in(user)
   session[:remember_token] = user.id
   current_user = user
 end

 def signed_in?
 !current_user.nil?
end

 def current_user=(user)
 @current_user = user
 end

# def current_identity=(identity)
# @current_identity = identity
# end

# def current_identity
# @current_identity
# end

private

 def correct_user
 @user = User.find(params[:id])
 redirect_to(current_user) unless current_user?(@user)
 end

 def current_user
 @current_user ||= session[:remember_token] && User.find(session[:remember_token])
 end

 def current_user?(user)
 user == current_user
 end

 def sign_out
 @current_user = session[:remember_token] = nil
 end

 def signed_in_user
 redirect_to signin_path, notice: "Please sign in." unless signed_in?
 end

end
