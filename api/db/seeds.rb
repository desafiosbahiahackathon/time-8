# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.create(name: 'Tester', username: 'test', password: '123', user_class: 0,
            cpf: '192.168.129-69', address: 'Rua do Corte Gigante, Alto da Quebrada, Salvador-BA',
            cep: '696666-68', birthday: '10-10-2010')

QuestionType.destroy_all
QuestionType.create(kind: "text", label: "texto", has_multiple_answers: false)
QuestionType.create(kind: "radio", label: "escolha unica", has_multiple_answers: true)
QuestionType.create(kind: "checkbox", label: "escolha multipla", has_multiple_answers: true)
QuestionType.create(kind: "textarea", label: "texto longo", has_multiple_answers: false)
QuestionType.create(kind: "number", label: "número", has_multiple_answers: false)

Form.destroy_all
form = Form.new(title: "Certidão Negativa de Endereço")

FormQuestion.destroy_all
question = FormQuestion.create(question_type_id: 1, label: "Dia", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Mês", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Ano", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Juntamente com", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Endereço", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Bairro", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Telefone", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Residência da senhora", required: true)
question = FormQuestion.create(question_type_id: 1, label: "Número da medida preventiva", required: true)
question = FormQuestion.create(question_type_id: 1, label: "1ª Tentativa", required: true)
question = FormQuestion.create(question_type_id: 1, label: "2ª Tentativa", required: true)
question = FormQuestion.create(question_type_id: 1, label: "3ª Tentativa", required: true)
question = FormQuestion.create(question_type_id: 4, label: "Ligações realizadas para o númeroo constado no BO da DEAM, data e hora:", required: true)


