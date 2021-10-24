Rails.application.routes.draw do
  get 'login', to: 'login#login'
  post 'login', to: 'login#login_handler'
  get 'logout', to: 'login#logout'
  
  get 'q', to: 'question#get'
  post 'q', to: 'question#create'
  
  get 'q/:qid/a', to: 'answer#get'
  get 'q/:qid/as', to: 'answer#all'
  post 'q/:qid/a', to: 'answer#create'
  get 'q/:qid/a/:tkt', to: 'answer#view'

  get 'q/:qid/t', to: 'teller#get'
  get 'q/:qid/ts', to: 'teller#all'
  put 'q/:qid/t', to: 'teller#put'

  get 'q/:qid/p', to: 'person#get'
  get 'q/:qid/ps', to: 'person#all'
  put 'q/:qid/p', to: 'person#put'
end
