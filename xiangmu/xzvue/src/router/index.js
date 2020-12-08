import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Header from '../components/MinUI/Header.vue'
import Footer from '../components/MinUI/Footer.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Test1 from '../views/Test1.vue'
import List from '../views/List.vue'
import Details from '../views/Details.vue'
import Shopcar from '../views/Shopcar.vue'

Vue.use(VueRouter)

const routes = [
  {
    path:'/header',
    component:Header,
    'v-header':Header
  },
  {
    path:'/list',
    component:List
  },
  {
    path:'/shopcar',
    component:Shopcar
  },
  {
    path:'/details/:id',
    component:Details
  },
  {
    path:'/footer',
    component:Footer,
    'v-footer':Footer
  },
  {
    path:'/test1',
    component:Test1
  },
  {
    path:'/register',
    component:Register
  },
  {
    path:'/login',
    component:Login
  },
  {
    path: '/',
    name: 'home',
    component: Home
  },
  { //这里是懒加载，暂时不要问，明天讲
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes
})

export default router
