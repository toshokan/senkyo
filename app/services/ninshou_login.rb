class NinshouLogin
  def login(user, pw)
    if user.include?("@")
      payload = {email: user, password: pw}
    else
      payload = {user: user, password: pw}
    end
    
    r = HTTP
      .headers(content_type: "application/json")
      .post("https://api.ctf.mcgill.ca/ninshou/api/v1/authenticate/simple", json: payload)
    if r.status.code != 200
      return nil
    end
    claims = Base64.decode64(r.body.to_s.split(".")[1])
    JSON.parse(claims)["sub"]
  end
end
