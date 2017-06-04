<template>
  <table class="table table-hover">
    <thead>
      <tr>
        <th width="10%">ID</th>
        <th width="50%">Nome da Tabela</th>
        <th width="40%">Opções</th>
      </tr>
    </thead>
  <tbody>
      <table-item> <slot> </slot> </table-item>
    </tbody>
  </table>
</template>

<script>
  import TableItem from './TableItem'

  export default {
    name: 'table-structure',
    components: { TableItem }
  }
</script>

<style>
</style>

<!--import AddQuestion from '../components/AddQuestion'
<add-question> </add-question>-->
