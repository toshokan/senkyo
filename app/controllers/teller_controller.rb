class TellerController < ApplicationController
  include LoginHelper
  include TellerHelper
  before_action :require_login
  before_action :require_teller
  
  def get
    @q = helpers.extract_question
  end

  def all
    q = helpers.extract_question
    ts = Teller.where(question: q)
      .order(user: :asc)
      .map { |t| t.user }
      .join("\n")
    render plain: ts
  end

  def put
    q = helpers.extract_question
    new_tellers = params[:tellers].lines
    Teller.transaction do
      Teller.where(question: q).destroy_all
      new_tellers.each do |t|
        Teller.new(question: q, user: t.strip).save!
      end
    end
    render plain: "ok"
  end
end
