<template>
    <div class="header-box">
    <div class="bg">
    <div class="login">
        <h2 >账号密码登录</h2>
        <div class="login-one">
            <mt-field type="text" style="margin-bottom:15px;"
            label="用户名"
            placeholder="请输入账号"
            :attr="{maxlength:10}"
            v-model="username"
            @blur.native.capture="checkUsername"></mt-field>
            <br>
            <mt-field type="text" placeholder="请输入密码"
            label="密码"
            v-model="password"
            :attr="{maxlength:20,autocomplete:'off'}"
            @blur.native.capture="checkPassword"></mt-field>
            <br>
            <mt-button type="primary" size="large" @click="handle">确认登录</mt-button>
            <br>
        </div>
        <div class="login-two">
            <label><input type="radio" name="sex" value="记住密码">记住密码</label>
        </div>
        <div class="login-three">
            <router-link to="/register">
                    注册新用户
            </router-link>
        </div>
    </div>
    </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            username:'',
            password:'',
            // 用户名的状态
            usernameState:'',
            // 密码的状态
            passwordState:'',
        }
    },
    methods:{
      checkUsername(){
         //校验用户名
            let usernameRegExp = /^[0-9a-zA-Z_]{6,10}$/;
            if(usernameRegExp.test(this.username)){
                this.usernameState = 'success';
                //console.log('用户名正确')
                return true;
            }else{
                this.usernameState = 'error';
                alert("用户名为必填项");
                // this.$toast({
                //     message:'用户名为必填项',
                //     position:"top",
                //     duration:"2000",
                //     });
                    return false;
            }
            
      },
      //校验密码
      checkPassword(){
        let passwordRegExp = /^[0-9a-zA-Z_]{8,20}$/;
        if(passwordRegExp.test(this.password)){
          this.passwordState = 'success';
          //console.log('密码正确');
          return true;
        }else{
          this.passwordState = 'error'
          alert("密码未填或格式错误");
        //   this.$toast({
        //     message:'密码格式错误',
        //     position:"top",
        //     duration:"2000"
        //   });
          return false;
        }
      },
        handle(){
          if(this.checkUsername() && this.checkPassword()){
            let obj = {
              username:this.username,
              password:this.password
            }
            this.axios.post('login',this.qs.stringify(obj)).then(res=>{
              if(res.data.code == 1){
                this.$router.push('/');
                //console.log("登录陈功")
              }else{
                this.$messagebox("登录提示","用户名或密码错误")
                //console.log("用户名或密码错误")
              }
            })
          }
          //   console.log('所有条件皆符合')
          // }else{
          //   this.$toast({
          //   message:'有必填项未填！',
          //   position:"top",
          //   duration:"2000"
          // })
          // }
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
    width: 100%;
    background: url(../assets/images/login1.jpg) no-repeat top center;
    height: 815px;
}
</style>