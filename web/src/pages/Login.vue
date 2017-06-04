<template>
    <main-layout>
      <div class="row">
        <div class="col-md-4 col-md-offset-4">
          <div class="login-panel panel panel-default">
            <div class="panel-heading">
              <img src="../assets/logo.png" width="100%">
              <h3 class="panel-title login-info">Insira seus dados para continuar</h3>
            </div>
            <div class="panel-body">
              <form role="form">
                <fieldset>
                  <div class="form-group">
                    <input class="form-control" placeholder="Nome Usuario" name="username" v-model="username" type="text" autofocus>
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="Senha" name="password" v-model="password" type="password" value="">
                  </div>
                  <!-- Change this to a button or input when using this as a form -->
                  <input type="button" value="Entrar" @click="login" class="btn btn-lg btn-success btn-block">
                </fieldset>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main-layout>
</template>

<script>
import MainLayout from '../layouts/Main'

import configs from '../config.js'

export default {
  name: 'Login',
  data: function () {
    return {
      username: '',
      password: ''
    }
  },
  components: { MainLayout },
  methods: {
    login: function () {
      console.log('URL Base - ' + configs.base_url + '\nTentando se conectar ao sistema')

      this.$http.post(configs.base_url + '/sessions.json',
        {
          'username': this.username,
          'password': this.password
        }).then(function (response) {
          localStorage.secure_token = response.body.token
          this.$router.push('/')
        }, function () {
          this.username = ''
          this.password = ''
          localStorage.secure_token =
          alert('Usuario ou senha incorretas')
        })
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
  .login-info{
    margin: 10px 3px 5px;
    font-weight: 600;
    text-align: center;
  }
</style>
