<template>
  <div>
    <div class="shopcar">
      <div class="shopcar_li">
        <ul>
          <li>
            <div class="pr" v-for="(item, index) in shopcar" :key="index" :name="item.id">
              <router-link :to="`/details/${item.id}`">
                <img :src="item.src"  class="shopcar_li_src"alt/>
                <div style="display:none">{{item.id}}</div>
                <div class="shopcar_li_name">{{item.name}}</div>
                <div>
                  ￥
                  <div class="shopcar_li_price">{{item.price}}</div>/454g(1.0磅)
                </div>
              </router-link>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<style scoped>
.shopcar {
  background-color: rgb(241, 238, 238);
  min-height: 400px;
  width: 70%;
  margin-top: 100px;
  margin-left: 15%;
  margin-bottom: 50px;
  margin-top: 130px;
}
.shopcar_li {
  background-color: rgb(253, 251, 251);
  min-height: 150px;
  min-width: 80%;
  margin-top: 50px;
}
.shopcar_li_src{
    width: 120px;
    height: 132px;
}
.shopcar .shopcar_li ul{
    list-style-type:none;
    padding-top:50px;
}
</style>
<script>
import axios from "axios";
export default {
    data() {
    return {
        shopcar:[]
    }
    },
    mounted() {
    axios.get("http://localhost:3000/shopcar1").then(res => {
      console.log(res.data);
      this.shopcar = res.data;
    });
  },
}
</script>