class CreateFormQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :form_questions do |t|
      t.string :label, null: false
      t.boolean :required, default: false
      t.references :form, null: false, foreign_key: {on_delete: :cascade}
      t.references :question_type, null: false, foreign_key: {on_delete: :cascade}
    end
  end
end