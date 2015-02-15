class SessionsController < ApplicationController

  def new
  end

  def create
    name = params[:name]
    password = params[:password]

    user = User.find_by name: name
    if user.try(:authenticate, password)
       session[:user_id] = user.id
       redirect_to root_path
    else
      redirect_to sign_in_path, alert: "Name or Password not found"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:new_user_id] = nil
    redirect_to root_path
  end
end
