class SessionsController < ApplicationController
  def new
  end

  def create
    # get credentials from the form
    name = params[:name]
    password = params[:password]

    # find the user
    user = User.find_by name: name

    if user.try(:authenticate, password)

      # store the id in the session
      session[:user_id] = user.id

      # redirect back
      redirect_to root_path

    else
      redirect_to sign_in_path, alert: "Name or Password not found"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
