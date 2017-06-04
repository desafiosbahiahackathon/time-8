class CreateQuestionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_types do |t|
      t.string :kind, null: false
      t.string :label, null: false
      t.boolean :has_multiple_answers, default: false
    end
  end
end

