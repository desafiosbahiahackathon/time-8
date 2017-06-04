class UserQuestionAnswer < ActiveRecord::Base
  belongs_to :form_question
  belongs_to :question_answer_option
  belongs_to :protected, class_name: 'User'
  belongs_to :officer, class_name: 'User'
end