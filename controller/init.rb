# Define a subclass of Ramaze::Controller holding your defaults for all controllers. Note
# that these changes can be overwritten in sub controllers by simply calling the method
# but with a different value.

Ramaze.options.prefix = "/usagisan"

class Controller < Ramaze::Controller
  layout :default
  helper :xhtml
  engine :etanni


  # Helper methods

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    #redirect_to root_path
  end


end



# Here you can require all your other controllers. Note that if you have multiple
# controllers you might want to do something like the following:
#
#  Dir.glob('controller/*.rb').each do |controller|
#    require(controller)
#  end
#
require_relative 'main'
require_relative 'auth'

