module LoginHelper
  def log_in(user)
    cookies.signed[:user_id] = user
  end

  def is_logged_in
    current_user != nil
  end

  def current_user
    cookies.signed[:user_id]
  end

  def log_out
    cookies.signed[:user_id] = nil
  end
end
