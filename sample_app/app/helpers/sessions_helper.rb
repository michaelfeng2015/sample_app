module SessionsHelper
  # 登陆指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end
  # 返回当前登陆的用户
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # 记住当前用户，并创建20天有效期的cookies
  def remember(user)
    user.remember
    cookies.signed[:user_id] = { value:   user.id,
                                 expires: 20.days.from_now.utc }
    cookies[:remember_token] = { value:   user.remember_token,
                                 expires: 20.days.from_now.utc } 
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end 

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  # 重定向到存储的地址，或者默认地址
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # 存储以后需要获取的地址
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end