class PersonController < ApplicationController
  include LoginHelper
  before_action :require_login
  
  def get
    @q = question
    user = helpers.current_user
    if !Teller.where(question: @q, user: user).first
      render plain: "not allowed"
      return
    end
  end

  def all
    q = question
    user = helpers.current_user
    if !Teller.where(question: q, user: user).first
      render plain: "not allowed"
      return
    end
    ts = Person.where(question: q)
      .map { |t| t.user }
      .join("\n")
    render plain: ts
  end

  def put
    q = question
    user = helpers.current_user
    new_people = params[:people].lines
    if !Teller.where(question: q, user: user).first
      render plain: "not allowed"
      return
    end
    Person.transaction do
      Person.where(question: q).destroy_all
      new_people.each do |p|
        Person.new(question: q, user: p.strip).save!
      end
    end
    render plain: "ok"
  end

  private
  def question
    qid = params[:qid]
    Question.where(qid: qid).first
  end
end
