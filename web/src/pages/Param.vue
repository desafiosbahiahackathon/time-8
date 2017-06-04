<template><div class="param">
  <input type="text" size="30" v-model="UserInput" />
  <input type="button" value="Go to route" @click="GoToRoute()">
  </div>
</template>

<script>
export default {
  name: 'Param',
  data () {
    return {
      UserInput: ''
    }
  },
  methods: {
    GoToRoute: function () {
      this.$router.push({ name: 'Paramdetails', params: { id: this.UserInput } })
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
