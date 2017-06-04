import Home from './pages/Home'
import Login from './pages/Login'
import About from './pages/About'
import ExitMod from './pages/ExitMod'
import CadastroForm from './pages/CadastroForm'
import NovoForm from './pages/NovoForm'

export default [
  {
    'path': '/',
    'component': Home
  },
  {
    'path': '/login',
    'component': Login
  },
  {
    'path': '/about',
    'component': About
  },
  {
    'path': '/exit',
    'component': ExitMod
  },
  {
    'path': '/cadastro-form',
    'component': CadastroForm
  },
  {
    'path': '/novo-form',
    'component': NovoForm
  }
]
