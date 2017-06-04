class FormsController < ApplicationController
  def index
    render json: Form.all()
  end

  def show


    form = Form.find_by(id: params[:id])
    if(form)
      render json: form.to_json
    else
      render json: { errors: @form.errors.full_messages }, status: 422
    end
  end

  def create
    @form = Form.new(title: params[:form][:title])
    params[:form][:questions].each do |q|
      @quest = FormQuestion.new(label: q[:label], required: q[:required], question_type_id: q[:question_type_id])
      if q[:options].any?
        q[:options].each do |o|
          @op = QuestionAnswerOption.create(label: o[:label])
          @quest.question_answer_options << @op
        end
      end
      @form.form_questions << @quest
      @quest.save()
    end
    if @form.save()
      render json: @form
    else
      render json: { errors: @form.errors.full_messages }, status: 422
    end
  end

  def destroy
    logout
    head :ok
  end

  private

  def logout
    if current_user
      current_user.invalidate_token
    end
  end
end