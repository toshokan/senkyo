class TellerController < ApplicationController
  include LoginHelper
  before_action :require_login
  
  def get
    @q = helpers.extract_question
    user = helpers.current_user
    if !Teller.where(question: @q, user: user).first
      render plain: "not allowed"
      return
    end
  end

  def all
    q = helpers.extract_question
    user = helpers.current_user
    if !Teller.where(question: q, user: user).first
      render plain: "not allowed"
      return
    end
    ts = Teller.where(question: q)
      .map { |t| t.user }
      .join("\n")
    render plain: ts
  end

  def put
    q = helpers.extract_question
    user = helpers.current_user
    new_tellers = params[:tellers].lines
    if !Teller.where(question: q, user: user).first
      render plain: "not allowed"
      return
    end
    Teller.transaction do
      Teller.where(question: q).destroy_all
      new_tellers.each do |t|
        Teller.new(question: q, user: t.strip).save!
      end
    end
    render plain: "ok"
  end
end
