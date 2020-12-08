<template>
  <div class="content-box">
    <div class="top-load-p" id="list-loading" style="display: none;">加载中……</div>
    <div class="pro-list-content">
      <div class="pro-list-filter" style>
        <dl class="cat-list">
          <dt>分类：</dt>
          <dd class>
            <a href="javascript:void(0);">全部分类</a>
          </dd>
          <dd class="sub-cat sub-cat-2-3-4-5-6-20-49-18-74-75-68 active">
            <a data-ids="2,3,4,5,6,20,49,18,74,75,68">蛋糕</a>
          </dd>
          <dd class="sub-cat sub-cat-29-61">
            <a data-ids="29,61">冰淇淋</a>
          </dd>
          <dd class="sub-cat sub-cat-35-37">
            <a data-ids="35,37">咖啡下午茶</a>
          </dd>
          <dd class="sub-cat sub-cat-36">
            <a data-ids="36">常温蛋糕</a>
          </dd>
          <dd class="sub-cat sub-cat-52">
            <a data-ids="52">设计师礼品</a>
          </dd>
          <dd class="sub-cat sub-cat-81-80-79-78-77-76">
            <a data-ids="81,80,79,78,77,76">面包</a>
          </dd>
        </dl>
        <dl class="tag-list">
          <dt>口味：</dt>
          <dd class="active tag-title">
            <a href="javascript:void(0);">全部口味</a>
          </dd>
          <dd class="sub-tag sub-tag-1">
            <a data-id="1">乳脂奶油</a>
          </dd>
          <dd class="sub-tag sub-tag-2">
            <a data-id="2">慕斯</a>
          </dd>
          <dd class="sub-tag sub-tag-3">
            <a data-id="3">乳酪</a>
          </dd>
          <dd class="sub-tag sub-tag-5">
            <a data-id="5">巧克力</a>
          </dd>
          <dd class="sub-tag sub-tag-6">
            <a data-id="6">坚果</a>
          </dd>
          <dd class="sub-tag sub-tag-7">
            <a data-id="7">水果</a>
          </dd>
          <dd class="sub-tag sub-tag-9">
            <a data-id="9">咖啡</a>
          </dd>
          <dd class="sub-tag sub-tag-4">
            <a data-id="4">冰淇淋</a>
          </dd>
          <dd class="sub-tag sub-tag-80">
            <a data-id="80">应季</a>
          </dd>
        </dl>
      </div>
      <div class="list">
        <ul>
          <li>
            <div class="pr" v-for="(item, index) in list" :key="index" :name="item.id">
              <router-link :to="`/details/${item.id}`">
                <img :src="item.src" alt v-model="src1" value="item.src"/>
                <div style="display:none" v-model="id1" :value="item.id">{{item.id}}</div>
                <div class="dgname" v-model="name1">{{item.name}}</div>
                <div>
                  ￥
                  <div v-model="price1">{{item.price}}</div>/454g(1.0磅)
                </div>
              </router-link>
              <div class="new">
                <a href="/">新品</a>
              </div>
              <img
                src="../assets/images/07.png"
                alt
                class="gwc"
                style="width: 25px;
  height: 25px;margin-left:2px;border-bottom: 1px none black;"
              />
              <mt-button style="background-color:#D5BFA7" @click='shopcar(index)'>加入购物车</mt-button>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
// 引入 qs 模块进行 数据 格式调整  npm i qs -S
	import qs from 'qs'
export default {
  data() {
    return {
      list: [],
      //list1:[],
      id1:'',
      name1:'',
      src1:'',
      price1:''
    };
  },

  mounted() {
    axios.get("http://localhost:3000/list").then(res => {
      console.log(res.data);
      this.list = res.data;
    });
  },
  methods: {
    shopcar(index) {
        axios.get("http://localhost:3000/list").then(res => {
        console.log(res.data);
        this.list = res.data;
        let a = res.data;
        console.log(res.data[index].id)
        console.log(res.data[index].name)
        console.log(res.data[index].price)
        console.log(res.data[index].src)
      // let id = document.getElementById("id1").innerHTML
      // let name = document.getElementById("name1").innerHTML
      // let src = document.getElementById("src1").innerHTML
      // let price = document.getElementById("price1").innerHTML
      // console.log(id);
      // console.log(name);
      // for(var i of a){
      //   for(var j of i){
      //     console.log(j+1)
      //   }
      // }
      // console.log(i.id);
      // console.log(i.name);
        axios
        .post(
          "/shopcar",
          "id=" +
            res.data[index].id +
            "&name=" +
            res.data[index].name +
            "&price=" +
            res.data[index].price +
            "&src=" +
            res.data[index].src
        )
      // console.log
      // let goods = this.shopcar[index];
      // //console.log(goods+"11");
      // let data = qs.stringify({id1:this.id1,name1:this.name1,src1:this.src1,price1:this.price})
      // console.log(data);
      // axios.post(
      //   'http://localhost:3000/shopcar',data
      // )
      
        .then(res => {
          //商品添加成功
          if (res.data.code == 1) {
            this.$router.push("/shopcar");
          } else {
            this.$messagebox("添加提示", "添加失败");
          }
        });
       });
      
    }
  }
};
</script>
<style scoped>
.content-box {
  width: 1200px;
  height: 100%;
  margin: 0 auto;
  padding-bottom: 250px;
  margin-bottom: 50px;
}
.pro-list-filter {
  font-size: 13px;
  margin-top: 25px;
  margin-bottom: 35px;
  width: 1200px;
  border-top: #f2f2f2 solid 1px;
  border-bottom: #f2f2f2 solid 1px;
  overflow: hidden;
  padding: 8px 0;
}
.pro-list-filter dl {
  line-height: 50px;
  overflow: hidden;
  height: 50px;
}
.pro-list-filter dl {
  line-height: 50px;
  overflow: hidden;
  height: 50px;
}
.pro-list-filter dl dt {
  color: #9b9b9b;
  margin-right: 38px;
}
.pro-list-filter dl dt,
.pro-list-filter dl dd {
  float: left;
  margin: 0 13px;
}
.pro-list-pr li {
  float: left;
  padding: 0 18px;
  margin: 0 18px;
  position: relative;
  overflow: hidden;
}
.list {
  overflow: hidden;
}
.list li {
  float: left;
  padding: 0 18px;
  margin: 0 18px;
  position: relative;
}
.list .pr {
  border: 1px solid black;
  float: left;
  margin-left: 10px;
  margin-top: 10px;
}
.list .pr img {
  width: 228px;
  height: 246px;
  border-bottom: 1px solid black;
}
a:visited,
a:link,
a {
  color: #684029;
  text-decoration: none;
  outline: none;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
}
.list .pr .new a {
  display: inline-block;
  border: 1px solid #d5bfa7;
  border-radius: 100px;
  padding: 0 6px 0 8px;
  color: #d5bfa7;
  margin: 8px 3px;
}
.gwc {
  width: 10px;
  height: 10px;
}
</style>