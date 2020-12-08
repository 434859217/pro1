import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
//导入Mint UI 
import MintUI from 'mint-ui'; 
//导入样式文件 
import 'mint-ui/lib/style.min.css'; 
//注册为Vue的插件 
Vue.use(MintUI) 
import qs from 'qs'

axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.config.productionTip = false
Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')