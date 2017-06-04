class QuestionType < ActiveRecord::Base
  has_many :form_questions
end