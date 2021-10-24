class Question < ApplicationRecord
  has_many :teller
  has_many :person
  has_many :answer
end
