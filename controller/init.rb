# Define a subclass of Ramaze::Controller holding your defaults for all controllers. Note
# that these changes can be overwritten in sub controllers by simply calling the method
# but with a different value.

Ramaze.options.prefix = "/usagisan"

class Controller < Ramaze::Controller
  layout :default
  helper :xhtml
  engine :etanni


  # Helper methods

  #def current_user
  #  return unless session[:user_id]
  #  @current_user ||= User.find(session[:user_id])
  #end

  #def logged_in?
  #  !!session[:user_id]
  #end

  #def authenticate
  #  return if logged_in?
    #redirect_to root_path
  #end

  def logout
    clear_user
    flash[:info] = "Logout."
    redirect_referrer
  end

  protected


	def clear_user
		session.delete(:identifier)
		#session.delete(:expire_at)
		session.delete(:registering_email)
		return nil
	end

	def current_identifier
		#if session[:expire_at]
		#	expire_time = Time.parse(session[:expire_at])
		#	if session[:identifier]
		#		if expire_time > Time.now
					session[:identifier]
		#		else
		#			clear_user
		#		end
		#	else
		#		nil
		#	end
		#end
	end

	def print_current_identifier
    session[:identifier] ? "#{session[:identifier][:iss]} -- #{session[:identifier][:sub]}" : "Nobodyknows+"
	end

	def logged_in?
		!!current_identifier
	end

	def current_user
		User.find_by_identity(current_identifier)
	end

	def kanrinin?
		(user = current_user) && user.kanrinin
	end

  # for debug
  def session_inspect
    session.class
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
require_relative 'nakanohito'

