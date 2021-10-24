module TellerHelper
  def require_teller
    q = helpers.extract_question
    user = helpers.current_user
    if !Teller.where(question: q, user: user).first
      render plain: "not allowed"
    end
  end
end
