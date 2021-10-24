class AnswerController < ApplicationController
  include LoginHelper
  before_action :require_login
  
  def get
    @q = question
    if !@q
      render plain: "not found"
      return
    end
    if !Person.where(question: @q, user: helpers.current_user).first
      render plain: "no"
      return
    end
  end

  def all
    q = question
    if q
      t = Teller.where(question: q, user: helpers.current_user)
    end
    if !t
      render plain: "no"
      return
    end
    @as = Answer.where(question: q)
  end

  def view
    tkt = params[:tkt]
    q = question
    if q
      a = Answer.where(question: q, ticket: tkt).first
    end
    if !a
      render plain: "not found"
      return
    end
    render plain: a.entry
  end

  def create
    entry = params[:answer]
    q = question
    if !q
      render plain: "not found"
      return
    end
    user = helpers.current_user
    if PersonAnswer.where(qid: q.qid, user: user).first
      render plain: "already answered"
      return
    end
    if !Person.where(question: @q, user: user).first
      render plain: "no"
      return
    end
    tkt = SecureRandom.uuid
    Answer.transaction do
      Answer.new(question: q, entry: entry, ticket: tkt).save
      PersonAnswer.new(qid: q.qid, user: user).save
    end

    render plain: tkt
  end

  private

  def question
    qid = params[:qid]
    q = Question.where(qid: qid).first
  end
end
