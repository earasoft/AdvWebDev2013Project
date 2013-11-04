class HomeController < ApplicationController
  def index

  end

  def user_directory
    @users = User.all
  end
end
