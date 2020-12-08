<template>
    <div class="header-box">
        <div class="header">
            <div class="header-nav">
              <a class="header-logo">
                <router-link to="/">
                   <img src="../../assets/images/logo.png">
                </router-link>
              </a>
                <ul class="nav-box">
                  <li>
                    <router-link to="/">
                    首页
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/">
                    蛋糕
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/list">
                    面包
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/">
                    冰淇淋
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/">
                    咖啡下午茶
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/">
                    全国送
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/">
                    企业专区
                    </router-link>
                  </li>
                </ul>
                <div class="header-right" style="margin-top:30px">
                  <li>
                    <router-link to="/">
                    APP下载
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/">
                    消息
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/login">
                    登录
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/register">
                    注册
                    </router-link>
                  </li>
                  <li>
                    <router-link to="/shopcar" class="header-cart" style="margin-top:-25px">
                       <img src="../../assets/images/icon.png" alt="">
                    </router-link>
                  </li>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
.header{
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1000000;
  width: 100%;
  height: 80px;
  background: #FFF;
  box-shadow: 0 2px 2px 0 rgba(195,195,195,0.50);
}
.header .header-logo img {
    width: 120px;
    height: 44px;
}
.header .header-logo {
    display: block;
    float: left;
    width: 120px;
    height: 44px;
    margin-top: 13px;
    margin-left: 300px;
}
.header .nav-box {
    position: relative;
    float: left;
    line-height: 50px;
    height: 80px;
    margin-left: 5px;
}
.header .nav-box li {
    float: left;
    margin: 0 10px;
    font-size: 14px;
    position: relative;
    list-style: none; 
}
.header .header-right{
  position: relative;
  float: right;
  margin-right: 500px;
  margin-top: 30px;
}
.header .header-right li{
  margin: 0 10px;
  position: relative;
  float: right;
  list-style: none; 
}
.header .header-cart {
    position: relative;
    padding-right: 6px;
    padding-left: 15px;
}
.header .header-user, .header .header-cart {
    float: left;
    display: block;
    height: 32px;
    padding-top: 22px;
    padding-bottom: 20px;
}
a:visited, a:link, a {
    color: #684029;
    text-decoration: none;
    outline: none;
    cursor: pointer;
    -webkit-tap-highlight-color: transparent;
}
.header .header-cart i {
    background: url(../../assets/images/icon.png) no-repeat;
    /* background-position: -286px -76px;
    background-size: 310px 120px; */
    height: 18px;
    margin-top: 9px;
}
</style>