module QuestionHelper
  def extract_question
    qid = params[:qid]
    Question.where(qid: qid).first
  end
end
