class PersonController < ApplicationController
  include LoginHelper
  include TellerHelper
  before_action :require_login
  before_action :require_teller
  
  def get
    @q = helpers.extract_question
    user = helpers.current_user
  end

  def all
    q = helpers.extract_question
    ts = Person.where(question: q)
      .map { |t| t.user }
      .join("\n")
    render plain: ts
  end

  def put
    q = helpers.extract_question
    new_people = params[:people].lines
    Person.transaction do
      Person.where(question: q).destroy_all
      new_people.each do |p|
        Person.new(question: q, user: p.strip).save!
      end
    end
    render plain: "ok"
  end
end
