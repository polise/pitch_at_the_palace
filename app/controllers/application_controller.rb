class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def startup_cookie(id)
  	cookies[:startup] =  id
  end

  def vote(voterid,startupid)
  	
  end

  def get_cookie()
    if cookies[:startup]
      return cookies[:startup]
    else
      return 'invalid, no cookie saved'
    end
  end

end
