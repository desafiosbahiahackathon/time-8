class CreateQuestionAnswerOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :question_answer_options do |t|
      t.string :label, null: false
      t.references :form_question, null: false, foreign_key: {on_delete: :cascade}
    end
  end
end
