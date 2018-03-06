
class NakanohitoController < Controller
  
  def register
    @title = "ユーザ登録"
    if request.post?
      user = User.create(:name => request[:nickname], :identity_uri => session[:openid_identity])
      if user.saved?
        flash[:success] = "New user '#{user.nickname}' has created."
        redirect MainController.r(:index)
      else
        user.errors.each do |e|
          flash[:error] = e.join(',')	# e is Array of String???
        end
      end
    else
      #@nickname = session[:openid_sreg]['nickname'] if session[:openid_sreg]
      @nickname = ""
      @email = session[:registering_email]
    end
  end

  
end