import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/connect'
  },
  {
    path: '/connect',
    name: 'Connexion',
    component: () => import('../views/Connexion.vue')
  },
  {
    path: '/search',
    name: 'Recherche',
    component: () => import('../views/Recherche.vue')
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/ask',
    name: 'Ask',
    component: () => import('../views/Ask.vue')
  },
  {
    path: '/question',
    name: 'Question',
    component: () => import('../views/Question.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
