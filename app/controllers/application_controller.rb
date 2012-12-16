class ApplicationController < ActionController::Base

  protect_from_forgery

  def index
    @tasks = Task.all
  end

end
