<template>
<div> 
    <div class="bg">
    <div class="login">
        <h2 >账号注册</h2>
        <div class="login-one">
            <mt-field type="text" style="margin-bottom:15px;"
            label="用户名"
            placeholder="请输入账号"
            :attr="{maxlength:10}"
            v-model="username"
            @blur.native.capture="checkUsername"></mt-field>

            <mt-field type="text" placeholder="请输入密码"
            label="密码"
            v-model="password"
            :attr="{maxlength:20,autocomplete:'off'}"
            @blur.native.capture="checkPassword"></mt-field>

            <mt-field 
          type="password" 
          label="确认密码"
          placeholder="请再次输入密码"
          :attr="{maxlength:20,autocomplete:'off'}"
          v-model="conpassword"
          :state="conpasswordState"
          @blur.native.capture="checkConpassword">
        </mt-field>
        <br>
        </div>
        <div class="login-two">
            <mt-button type="primary" size="large" @click="handle">免费注册</mt-button>
        </div>
        <div class="login-three">
            <router-link to="/login">
                    已有账号
            </router-link>
        </div>
    </div>
    </div>
    </div>
</template>
<script>
export default {
  data(){
    return {
      // 用户名
      username:'',
      // 密码
      password:'',
      // 确认密码
      conpassword:'',
      // 用户名的状态
      usernameState:'',
      // 密码的状态
      passwordState:'',
      // 确认密码的状态
      conpasswordState:''
    }
  },
  methods:{
    //校验用户名
    checkUsername(){  
      let usernameRegExp = /^[0-9a-zA-Z_]{6,20}$/;
      if(usernameRegExp.test(this.username)){
        this.usernameState = 'success';
        return true;
      } else {
        this.usernameState = 'error';
        // this.$toast({
        //   message:"用户名为必填项",
        //   position:"top",
        //   duration:"2000"
        // });
        alert("用户名为必填项")
        return false;
      }
    },
    //校验密码
    checkPassword(){
      //密码的正则表达式
      let passwordRegExp = /^[0-9A-Za-z]{8,20}$/;
      if(passwordRegExp.test(this.password)){
        return true;
      } else {
        // this.$toast({
        //   message:"密码必须为字母、数字的组合体",
        //   position:"top",
        //   duration:"2000",

        // });
        alert("密码必须为字母、数字的组合体")
        return false;
      }
    },
    //校验确认密码
    checkConpassword(){
      if(this.password != this.conpassword){
          alert("两次密码不一致")
        // this.$toast({
        //   message:"两次密码不一致",
        //   position:"top",
        //   duration:"2000"
        // });
        return false;
      } else {
        return true;
      }
    },
    handle(){
      if(this.checkUsername() && this.checkPassword() && this.checkConpassword()){
        //该将获取到的信息提交到WEB服务器
        this.axios.post('/register','username=' + this.username + '&password=' + this.password).then(res=>{
          //用户注册成功
          if(res.data.code == 1){
            this.$router.push('/');
          }else{
            this.$messagebox('注册提示','此用户名已被占用');
          }
        });
      }
    }
  }
}
</script>

<style>
.home>h1{
  background-color:red;
  color:yellow
}

.login{
  position: absolute;
    width: 302px;
    top: 114px;
    right: 0;
    padding: 28px 42px;
    border: 1px #E9E9E9 solid;
    background: #fff;
    text-align: center;
    margin-right: 350px;
    margin-top: 25px;
}
.login .login-one input{
    height: 20px;
}
.login .login-two {
    margin-top: 25px;
    margin-right: 150px;
}
.login .login-three {
    margin-top: -20px;
    margin-right: -150px;
}
.bg{
    background: url(../assets/images/login1.jpg) no-repeat top center;
}
.toast{
    margin-top: 500px;
}
</style>