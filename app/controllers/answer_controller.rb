class AnswerController < ApplicationController
  include LoginHelper
  before_action :require_login
  
  def get
    @q = helpers.extract_question
    if !can_answer?
      render plain: "you cannot answer this question"
      return
    end
  end

  def all
    q = helpers.extract_question
    if q
      t = Teller.where(question: q, user: helpers.current_user).first
    end
    if !t
      render plain: "no"
      return
    end
    @as = Answer.where(question: q)
  end

  def view
    tkt = params[:tkt]
    q = helpers.extract_question
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
    q = helpers.extract_question
    if !q
      render plain: "not found"
      return
    end
    user = helpers.current_user
    if !can_answer?
      render plain: "you cannot answer this question"
      return
    end
    tkt = SecureRandom.uuid
    Rails.logger.silence do
      Answer.transaction do
        Answer.new(question: q, entry: entry, ticket: tkt).save
        PersonAnswer.new(qid: q.qid, user: user).save
      end
      render plain: "Your ticket number for this question is #{tkt}"
    end
  end

  private
  def can_answer?
    user = helpers.current_user
    q = helpers.extract_question
    allowed = Person.where(question: q, user: user).size
    answers = PersonAnswer.where(qid: q.qid, user: user).size
    allowed > answers
  end
end
