<template>
    <div class="footer">
	<div class="footer-main">
		<div class="footer-col footer-col-brand">
			<img class="footer-logo" src="//static.21cake.com/themes/site/img/footer-logo-v2.png" height="36" width="96" alt="21cake">
			<img class="footer-solgan" src="//static.21cake.com/themes/site/img/footer-solgan.png">
			<a href="http://weibo.com/21cake" target="_blank">
			    <img src="//static.21cake.com/themes/site/img/footer-icon-weibo.png">
			</a>
			<a class="footer-icon" data-ewmsrc="//static.21cake.com/themes/site/img/erweima.png">
			    <img src="//static.21cake.com/themes/site/img/footer-icon-weixin.png">
			</a>
			<a class="footer-icon" data-ewmsrc="//static.21cake.com/themes/site/img/footer-erweima.png">
				<img src="//static.21cake.com/themes/site/img/footer-icon-app.png">
			</a>
			<div class="footer-erweima footer" style="display: none;"><img src="//static.21cake.com/themes/site/img/erweima.png"></div>
		</div>
		<div class="footer-col footer-col-nav">
			<p class="footer-col-title">关于我们</p>
			<p>联系我们</p>
			<p class="footer-light">
				订购专线：400 650 2121
				（服务时间 08:00–22:00）；<br>
				企业团购热线：021-37768380；<br>
				客服电话：021-23099721（全国）；<br>
				kefu@21cake.com（邮箱）；
			</p>
			<a href="/doc-distribution-40.html">订购帮助</a>
			<a href="/doc-about-56.html">企业合作</a>
			<a href="/doc-about-115.html">生产经营资质</a>
			<a href="/article-company.html">公告专区</a>
		</div>
		<div class="footer-col footer-col-tips">
			<p class="footer-col-title">订购时间</p>
			<p class="footer-light">
				杭州/广州：提前5小时预订；<br>
				北京：提前6小时预订；<br>
				上海：提前5.5-6小时预订；<br>
				天津/苏州/无锡/深圳：提前8小时预订（部分偏远地区除外，当日22点以后订单，于次日8点开始审核）
				<span>当日蛋糕配送截止下单时间：北京/上海：16:30；杭州/广州：14:00；天津：10:30；苏州/无锡/深圳：11:00</span>
			</p>
		</div>
		<div class="footer-col footer-col-about">
			<p class="footer-col-title">网络运营</p>
			<p class="footer-light">
				网站注册公司名称: 北京廿一客食品有限公司 地址: 北京市北京经济技术开发区兴海二街5号院3号楼<br>
				网站运营：廿一客（上海）电子商务有限公司 地址：上海市松江区新效支路518号<br>
				上海廿一客食品有限公司分公司 地址：上海市松江区新效支路518号<br>
				杭州廿一客食品有限公司 地址：杭州市滨江区秋溢路500号<br>
				广州廿一客食品有限公司 地址：广州市南沙区东涌镇鱼窝头大道段   <br>   
				北京廿一客食品有限公司 地址：北京市北京经济技术开发区兴海二街5号院<br>
				深圳廿一客贸易有限公司 地址：深圳市福田区星河世纪大厦A栋1717  <br>       
				天津廿一客食品有限公司 地址：天津市河西区麦收大厦2-2004<br>
				广州廿一客食品贸易有限公司 地址：广州市南沙区东涌镇鱼窝头大道段  <br>
				举实（上海）食品有限公司 地址：上海市松江区新效支路518号
			</p>
		</div>
	</div>
	<div class="footer-copyright">
		<p>
			Copyright© 21Cake蛋糕官网商城 2007-2020, 版权所有
			<a style="color: #9a9a9a" target="_blank" href="http://www.miitbeian.gov.cn/">京ICP备14006254号-1</a>
			<a style="color: #9a9a9a" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11030102010682">京公网安备 11030102010682号</a>
		</p>	
	</div>
</div>
</template>
<style scoped>
.footer {
	margin-top: px;
    position: relative;
    background: url(../../assets/images/footer.jpg) no-repeat center 0;
}
.footer-main {
    width: 1200px;
    margin: 0 auto;
    height: 360px;
    padding-top: 50px;
    overflow: hidden;
}
.footer-col-brand {
    width: 230px;
    position: relative;
}
.footer-col {
    float: left;
}
.footer-logo {
    margin-bottom: 15px;
}
.footer-col-brand img, .footer-col-brand a {
    display: block;
}
.footer-col-brand img, .footer-col-brand a {
    display: block;
}
.footer-solgan {
    margin-bottom: 36px;
}
.footer-col p, .footer-col a {
    color: #fff;
    font-size: 12px;
    text-align: justify;
    line-height: 17px;
}
.footer-col-brand a {
    margin-bottom: 14px;
}
.footer-erweima {
    position: absolute;
    width: 160px;
    right: 20px;
    bottom: 0;
    animation: fterweima .35s ease-in-out forwards;
}
.footer-col-nav {
    width: 220px;
    margin-right: 65px;
}
.footer-col {
    float: left;
}
.footer .footer-light {
    color: #b3b2b2;
}
.footer-col p, .footer-col a {
    font-size: 12px;
    text-align: justify;
    line-height: 17px;
}
.footer-col-tips {
    width: 220px;
    margin-right: 65px;
}
.footer-col-about {
    width: 400px;
    text-align: justify;
}
.footer-copyright {
    width: 100%;
    text-align: center;
    line-height: 39px;
    font-size: 12px;
    color: #878787;
    border-top: 1px solid #8D8D8D;
}
.footer-col p, .footer-col a {
    color: #fff;
    font-size: 12px;
    text-align: justify;
    line-height: 17px;
}
.footer-col-nav a {
    margin-top: 10px;
    display: block;
}
a:visited, a:link, a {
    text-decoration: none;
    outline: none;
    cursor: pointer;
    -webkit-tap-highlight-color: transparent;
}
</style>