class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def dashboard

    @users = User.all

  end

end
