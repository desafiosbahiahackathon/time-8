<template>
  <main-layout>
    <h2>Fechando a Sessão do Usuario</h2>
  </main-layout>
</template>

<script>
  import MainLayout from '../layouts/Main.vue'

  export default {
    name: 'home',
    components: { MainLayout },
    created: function () {
      localStorage.secure_token = ''
      this.$router.push('/login')
    }
  }

</script>

<style>
</style>
