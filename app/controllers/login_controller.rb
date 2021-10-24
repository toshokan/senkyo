class LoginController < ApplicationController

  def login
  end

  def login_handler
    if params[:user] == params[:password]
      helpers.log_in(params[:user])
      render plain: "visit a question"
    else
      render plain: "nope"
    end
  end

  def logout
    helpers.log_out
    render plain: "ok"
  end
end
