class LoginController < ApplicationController

  def login
  end

  def login_handler
    user = params[:user]
    pw = params[:password]
    if user.include?("@")
      payload = {email: user, password: pw}
    else
      payload = {user: user, password: pw}
    end
    
    r = HTTP
      .headers(content_type: "application/json")
      .post("https://api.ctf.mcgill.ca/ninshou/api/v1/authenticate/simple", json: payload)

    if r.status.code == 200
      helpers.log_in(params[:user])
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
