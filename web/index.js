Vue.component('question', {
  template: `
    <div>\
      <input
          type="text"
          v-model="question.title"
          placeholder="Título da pergunta">
      
      <template v-if="has_multiple_options()">
        <template
          v-for="(option, index) in question.options">\
          <input
            type="text"
            v-model="option.label"
            placeholder="Valor da opção">
          <input\
            :type="question.type" disabled>\
          <button v-on:click="question.options.splice(index, 1)">X</button>\
        </template>\
      
        <label> Adicionar opção
          <input
            v-model="new_option_label"
            @keyup.enter="add_option">\
        </label>
      </template>

      <textarea v-else-if="question.type == 'textarea'" disabled></textarea>
      
      <input v-else :type="question.type" disabled>
          
      <button v-on:click="$emit('remove')">X</button>\

    </div>\
  `,
  props: ['question'],
  data: function() {
    return {
      new_option_label: '',
    }
  },
  methods: {
    has_multiple_options: function() {
      return this.question.type === 'radio'
            || this.question.type === 'checkbox'
    },
    add_option: function() {
      this.question.options.push({
        label: this.new_option_label
      })
      this.new_option_label = ''
    }
  }
})


var app = new Vue({
  el: '#app',
  data: {
    possible_formats: [
      { type: 'text', label: 'texto' },
      { type: 'radio', label: 'escolha unica' },
      { type: 'checkbox', label: 'multipla escolha' },
      { type: 'textarea', label: 'texto longo' },
      { type: 'number', label: 'número' }
    ],

    form: []
  },
  methods: {
    add_question: function(input_type) {
      this.form.push({
        id: this.form[this.form.length-1] + 1,
        type: input_type,
        required: false,
        title: '',
        options: []
      })
    }
  }
})

