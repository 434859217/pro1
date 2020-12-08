<template>
    <div class="details" ref="details">
        <div class="details_imgs" ref="details_imgs" @mousemove="handleMove">
            <img :src="detail.src" alt="">
            <div class="shadow" ref="shadow"></div>
        </div>
        <div class="larger" ref="larger">
            <img :src="detail.src" alt="" ref="big">
        </div>
        <div class="details_info" >
            <div class="details_info_left">
                <div class="name">{{detail.name}}</div>
                <ul class="con" style="list-style: none;margin-left:84px">
                    <li>
                        <img src="../assets/images/d1.png" alt="">
                        <span>奶油</span>
                    </li>
                    <li>
                        <img src="../assets/images/d2.png" alt="">
                        <span>莓果</span>
                    </li>
                    <li>
                        <img src="../assets/images/d3.png" alt="">
                        <span>柚子</span>
                    </li>
                </ul>
                <div class="js" style="padding-top:30px">
                    {{detail.detail}}
                    <!-- /第四代巧克力，复刻黑白巧克力慕斯/<br>
                    /天然的粉色、白色/<br>
                    /来自日本高知县柚子，和法国覆盆子/<br>
                    /在这里，色彩即风味/ -->
                </div>    
            </div>
            <div class="details_info_right">
               <div class="price">
                   {{detail.price}}
                   <!-- ¥298.00/454g(1.0磅) -->
               </div>
               <div class="img_box">
                   <ul>
                       <li>
                           <img src="../assets/images/d4.png" alt="">
                           <span>约12.5x12.5cm</span>
                       </li>
                       <li>
                           <img src="../assets/images/d5.png" alt="">
                           <span>适合3-4人分享</span>
                       </li>
                       <li>
                           <img src="../assets/images/d6.png" alt="">
                           <span>含5套餐具（蜡烛需单独订购）</span>
                       </li>
                       <li>
                           <img src="../assets/images/d7.png" alt="">
                           <span>最早今天 15:00配送</span>
                       </li>
                   </ul>
               </div>
               <div class="button">
                   <button class="nbug">立即购买</button>
                   <button class="ibug">加入购物车</button>
               </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
.details{
    width: 1088px;
    margin-left: 420px;
    height: 1000px;
    font-size: 12px;
    color: #684029;
}
.details .details_imgs img{
    width: 1088px;
    height: 612px;
    text-align: center;
}
.new a {
    display: inline-block;
    border: 1px solid #D5BFA7;
    border-radius: 100px;
    padding: 0 6px 0 8px;
    color: #D5BFA7;
    margin: 8px 3px;
    float: left;
}
.details_info_left{
    float: left;
    width: 484px;
}
.details_info_left .name{
    font-size: 20px;
    line-height: 28px;
    padding-top: 20px;
}
.price{
    height: 25px;
    line-height: 25px;
    font-size: 18px;
    z-index: 10;
    top: 165px;
    left: 335px;
    color: #C69C6D;
    padding: 20px 0 10px;
}
.con{
    overflow: hidden;
    margin-bottom: 14px;
    
}
.con li img{
    display: inline-block;
    height: 50px;
    width: 50px;
    vertical-align: middle;
}
.details_info_left .con li{
    float: left;
}
.img_box li{
    overflow: hidden;
    margin-bottom: 14px;
}
.details_info_right .img_box li{
    float: left;
}
.button{
    margin-top: 50px;
    float: left;
}
.button .nbug{
    margin-left: 90px;
    border: none;
    width: 167px;
    height: 30px;
    line-height: 30px;
    background: #F4F4F4;
    color: #7A5844;
}
.button .ibug{
    border: none;
    width: 167px;
    height: 30px;
    line-height: 30px;
    background: #684029;
    color: #fff;
    margin-left: 30px;
}
.larger {
    width: 544px;
    height: 306px;
    position: absolute;
    top: 85px;
    left: 0px;
    float: left;
    overflow: hidden;
    display: none;
}
 
.larger img {
    width: 1088px;
    height: 512px;
    position: absolute;
    left: px;
    top: px;
}
.shadow {
    width: 272px;
    height: 153px;
    background-color: rgba(145, 200, 200, 0.4);
    position: absolute;
    left: 428px;
    top: 85;
    z-index: 100;
    margin-left: 428px;
    display: none;
}
</style>
<script>
import axios from 'axios'
export default {
    data(){
        return {
            detail:{}
        }
    },
    methods: {
        // 获取元素到文档区域的坐标 
        getPosition: function(element){ 
            var dc = document, 
            rec = element.getBoundingClientRect(), 
            x = rec.left, // 获取元素相对浏览器视窗window的左、上坐标 
            y = rec.top; 
            // 与html或body元素的滚动距离相加就是元素相对于文档区域document的坐标位置 
            x += dc.documentElement.scrollLeft || dc.body.scrollLeft; 
            y += dc.documentElement.scrollTop || dc.body.scrollTop; 
            return { 
                left: x, 
                top: y 
            }; 
        },
        handleMove(evt) {
            var larger = this.$refs.larger;
            var shadow = this.$refs.shadow;
            var big = this.$refs.big;
            var pos = this.getPosition(this.$refs.details);
            var shadowRect = shadow.getBoundingClientRect();
            var bigRect = big.getBoundingClientRect();
            var contentRect = this.$refs.details_imgs.getBoundingClientRect();
            var maxX = contentRect.width - shadowRect.width;
            var maxY = contentRect.height - shadowRect.height;
 
            var X = evt.pageX - pos.left - shadowRect.width / 2;
            var Y = evt.pageY - pos.top - shadowRect.height / 2;
 
            if (X <= 0) {
                X = 0;
            }
            if (X >= maxX) {
                X = maxX;
            }
            if (Y <= 0) {
                Y = 0;
            }
            if (Y >= maxY) {
                Y = maxY;
            }
            // 防止遮罩层粘滞，跟随鼠标一起滑出大图位置
            var bigX = X * bigRect.width / contentRect.width;
            var bigY = Y * bigRect.height / contentRect.height;
            //  bigX / bigW = X / contentW,主图和遮罩层之间存在两倍关系，放大图和原图之间也有两倍关系
            shadow.style.left = X + "px";
            shadow.style.top = Y + "px";
 
            // console.log(X, Y, bigX, bigY);
 
            big.style.left = -bigX + "px";
            big.style.top = -bigY + "px";
 
            larger.style.display = "block";
            shadow.style.display = "block";
        }
    },
    mounted(){
        
        //this.$router,路由
        //this.$route,路由请求信息
        //1.获取地址栏中的ID
        let id = this.$route.params.id;
        console.log(1)
        console.log(id)
        //2.向WEB服务器发送请求
        this.axios.get('/details?id=' + id).then(res=>{
            let data = res.data.result;
            console.log(data)
            //data.avatar = require('../assets/avatar/' + data.avatar);
            this.detail = data;
        });
        axios.get('http://localhost:3000/details?id=' + id).then(res=>{
        console.log(res.data)
        this.detail = res.data[0]
    })
    },
    created(){
        console.log(0)
    }
}
</script>