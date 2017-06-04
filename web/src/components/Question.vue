<template>
  <div>
    <input
      type="text"
      v-model="question.title"
      placeholder="Título da pergunta">

    <template v-if="has_multiple_options()">
      <template
        v-for="(option, index) in question.options">
        <input
          type="text"
          v-model="option.label"
          placeholder="Valor da opção">
        <input
        :type="question.type" disabled>
        <button v-on:click="question.options.splice(index, 1)">X</button>
      </template>

      <label> Adicionar opção
        <input
          v-model="new_option_label"
          @keyup.enter="add_option">
      </label>
    </template>

    <textarea v-else-if="question.type == 'textarea'" disabled></textarea>

    <input v-else :type="question.type" disabled>

    <button v-on:click="$emit('remove')">X</button>

  </div>
</template>

<script>
  export default {
    name: 'question',
    props: ['question'],
    data: function () {
      return {
        new_option_label: ''
      }
    },
    methods: {
      has_multiple_options: function () {
        return this.question.type === 'radio' || this.question.type === 'checkbox'
      },
      add_option: function () {
        this.question.options.push({
          label: this.new_option_label
        })
        this.new_option_label = ''
      }
    }
  }
</script>

<style>
</style>
