class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    # Gebruikt && om te checken of user bestaat (email adres bekend is) en daarna password
    if user && user.authenticate(params[:sessions][:password])
      sign_in user # sign_in is in SessionHelper (included in ApplicationController)
      flash[:success] = "Signed in"
      redirect_back_to user
    else
      flash.now[:error] = "Failed to sign in, check email/password"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
