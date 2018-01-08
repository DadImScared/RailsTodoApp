class WelcomeController < ApplicationController
  def index
    redirect_to todo_lists_path if user_signed_in?
  end
end
