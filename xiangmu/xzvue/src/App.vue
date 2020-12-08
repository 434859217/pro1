<template>
  <div id="app">
    <!-- <div id="nav"> -->
      <v-header/>
      <!-- <div> -->
      
    <router-view/>
    <v-footer/>
  </div>
</template>
<script>
import Footer from './components/MinUI/Footer.vue'
import Header from './components/MinUI/Header.vue'
export default {
  components:{
    'v-footer':Footer,
    'v-header':Header
  },
}
</script>
<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
