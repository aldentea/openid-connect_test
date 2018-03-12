
class NakanohitoController < Controller

  before(:register) { redirect_index unless logged_in? }

  def register
    @title = "ユーザ登録"
    if request.post?
      user = User.create(:name => request[:nickname], :email => request[:email], :identifier => session[:identifier])
      if user.saved?
        flash[:info] = "新規ユーザ '#{user.name}' が作成されました！"
        redirect MainController.r(:index)
      else
        user.errors.each do |e|
          flash[:error] = e.join(',')	# e is Array of String???
        end
      end
    else
      @nickname = ""
      @email = session[:registering_email]
    end
  end

  def limited
    if current_user
      @title = "Welcome!"
      @name = current_user.name
    else
      flash[:error] = "ユーザ登録していない人は立ち入り禁止です！"
      redirect MainController.r(:index)
    end
  end

  def redirect_index
    flash[:error] = "ログインしていない人は立ち入り禁止です！"
    redirect MainController.r(:index)
  end


end