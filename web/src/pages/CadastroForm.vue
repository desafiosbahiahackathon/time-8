<template>
  <main-layout>
    <h1> Cadastro de Certidões </h1>

    <table-structure> <table-cell> </table-cell> </table-structure>

  </main-layout>
</template>

<script>
  import MainLayout from '../layouts/Main.vue'
  import TableStructure from '../components/TableStructure'
  import TableCell from '../components/TableItem'

  export default {
    name: 'home',
    components: { MainLayout, TableStructure, TableCell }
  }

</script>

<style>
</style>
