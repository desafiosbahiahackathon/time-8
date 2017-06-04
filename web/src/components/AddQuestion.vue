<template>
  <div>

    <input v-model="form_title" type="text" placeholder="Titulo da Certidão">

    <button
      v-for="format in possible_formats"
      @click="add_question(format.type)">
      {{ format.label }}
    </button>

    <question
      v-for="(question, index) in form"
      :question="question"
      :key="question.id"
      @remove="form.splice(index, 1)">

    </question>

    <div>
      <br/>
      <button class="btn btn-success" @click="envia"> Cadastrar Nova Certidão </button>
    </div>

  </div>
</template>

<style>
</style>

<script>
  import Question from './Question'
  import configs from '../config'

  export default{
    name: 'add-quest',
    data () {
      return {
        possible_formats: [
          { type: 1, label: 'texto' },
          { type: 2, label: 'escolha unica' },
          { type: 3, label: 'multipla escolha' },
          { type: 4, label: 'texto longo' },
          { type: 5, label: 'número' }
        ],
        form_title: '',
        form: []
      }
    },
    methods: {
      add_question: function (inputType) {
        this.form.push({
          id: this.form[this.form.length - 1] + 1,
          question_type_id: inputType,
          required: false,
          title: '',
          options: []
        })
      },
      envia: function () {
        var formEnvia = {
          form: {
            title: this.form_title,
            questions: this.form
          }
        }
        this.$http.post(configs.base_url + '/forms.json', formEnvia).then(
          function () {
            alert('Certidão enviada com sucesso')
          }, function () {
          alert('Certidão não enviada tente ovamente')
        })
      }
    },
    components: { Question }
  }
</script>
