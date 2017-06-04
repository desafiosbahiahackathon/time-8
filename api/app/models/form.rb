class Form < ActiveRecord::Base
  has_many :form_questions
  has_many :user_questions_answers, through: :form_questions

  def as_json(options={})
    super(include: { form_questions: { include:  :question_answer_options } })
  end
end