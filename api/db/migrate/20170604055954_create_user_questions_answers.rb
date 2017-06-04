class CreateUserQuestionsAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_questions_answers do |t|
      t.string :answer, null: false
      t.references :form_question, null: false, foreign_key: {on_delete: :cascade}
      t.references :question_answer_option, null: false
      t.references :protected, null: false
      t.references :officer
    end
  end
end
