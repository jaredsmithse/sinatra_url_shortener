helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def set_current_user(user_email)
    User.find_by_email(user_email).id
  end

  def create_user(info)
    info[:salt] = SecureRandom.base64(6)
    info[:password_hash] = Digest::MD5.hexdigest(info[:password_hash] + info[:salt])
    info
  end
end