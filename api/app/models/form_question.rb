class FormQuestion < ActiveRecord::Base
  belongs_to :form
  belongs_to :question_type

  has_many :question_answer_options
  has_many :user_question_answers
end