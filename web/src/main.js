/* Libraries */
import Vue from 'vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import routes from './routes.js'

/* Dependências utilizadas */
Vue.use(VueResource)
Vue.use(VueRouter)

/* Construtor de rotas */
const router = new VueRouter({
  'routes': routes,
  mode: 'history'
})

/* Secure Server */
router.beforeEach(function (to, from, next) {
  console.log('Checking if the user is working')
  console.log('Page ' + to.path)
  console.log(localStorage.secure_token)

  if (to.path === '/login') {
    if (localStorage.secure_token !== '' && localStorage.secure_token !== undefined) {
      next('/')
    } else {
      next()
    }
  } else if (localStorage.secure_token === '' || localStorage.secure_token === undefined) {
    next('/login')
  }
  next()
})

Vue.config.debug = true

/* Cria a Aplicação */
/* eslint-disable no-new */
var VUE = new Vue({
  el: '#app',
  router
})

VUE.$mount('#app')
