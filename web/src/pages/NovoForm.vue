<template>
  <main-layout>
    <h1> Cadastro de Nova Certidões </h1>

    <add-question> </add-question>

    <br/>
  </main-layout>
</template>

<script>
  import MainLayout from '../layouts/Main'
  import AddQuestion from '../components/AddQuestion'

  export default {
    name: 'home',
    components: { MainLayout, AddQuestion }
  }

</script>

<style>
</style>
