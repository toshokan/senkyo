class QuestionController < ApplicationController
  include LoginHelper
  before_action :require_login
  
  def get
  end
  
  def create
    q = Question.new(qid: SecureRandom.uuid, description: params[:description])
    t = Teller.new(user: helpers.current_user, question: q)
    Question.transaction do
      q.save!
      t.save!
    end
    render plain: q.qid
  end

  def destroy
  end
end
