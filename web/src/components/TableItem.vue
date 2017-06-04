<template>
  <tr>
    <td> {{ id_certidao }} </td>
    <td> {{ titulo_certidao }} </td>
    <td>
      <a :href="'/preenche-certidao/' + id_certidao" type="button" class="btn btn-success"> Preencher Certidão </a>
      <a :href="'/edita-certidao/' + id_certidao" type="button" class="btn btn-warning"> Editar Certidão</a>
      <a :href="'/remove-certidao/' + id_certidao" type="button" class="btn btn-danger"> Remover Certidão </a>
    </td>
  </tr>
</template>

<script>
  export default {
    name: 'table-item',
    components: { },
    data () {
      return {
        id_certidao: 'test',
        titulo_certidao: 'test'
      }
    }
  }
</script>

<style>
</style>
