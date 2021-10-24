class LoginController < ApplicationController

  def login
  end

  def login_handler
    user = params[:user]
    pw = params[:password]

    user = NinshouLogin.new.login(user, pw)

    if user
      helpers.log_in(user)
      render plain: "visit a question"
    else
      render plain: "nope"
    end
  end

  def logout
    helpers.log_out
    redirect_to login_path
  end
end
