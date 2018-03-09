class AuthController < Controller

  def callback
    auth = request.env['omniauth.auth']
    session[:identifier] = {}
    session[:identifier][:sub] = auth['uid']
    session[:identifier][:iss] = auth['provider']
    session[:registering_email] = auth['info']['email']
    if user = User.find_by_identity(session[:identifier])
      redirect MainController.r(:index)
    else
      redirect NakanohitoController.r(:register)
    end
    #auth.inspect # for debug
  end

end


class YconnectController < AuthController
  map '/auth/yconnect'
end

class GoogleController < AuthController
  map '/auth/google'
end
