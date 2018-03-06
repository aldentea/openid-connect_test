class AuthController < Controller

  #def create
  #  user = User.find_or_create_from_auth(request.env['omniauth.auth'])
  #  session[:user_id] = user.id
    #redirect_to root_path
  #end

  #def destroy
    #reset_session
    #redirect_to root_path
  #end

  def callback
    auth = request.env['omniauth.auth']
    session[:identifier][:sub] = auth['uid']
    session[:identifier][:iss] = auth['provider']
    session[:registering_email] = auth['info']['email']
    if user = User.find_by_identity(session[:identifier])
      redirect_to MainController.r(:index)
    else
      redirect_to NakanohitoController.r(:register)
    end
  end
  
end

