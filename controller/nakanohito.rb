
class NakanohitoController < Controller

  def register
    @title = "ユーザ登録"
    if request.post?
      user = User.create(:name => request[:nickname], :email => request[:email], :identifier => session[:identifier])
      if user.saved?
        flash[:success] = "New user '#{user.name}' has created."
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