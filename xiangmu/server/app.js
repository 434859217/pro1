const express = require('express');
const server = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const md5 = require('md5');

const mysql = require('mysql');
const pool = mysql.createPool({
  //MySQL数据库服务器的地址
  host:'127.0.0.1',
  //端口号
  port:3306,
  //数据库用户的用户名
  user:'root',
  //数据库用户的密码
  password:'',
  //数据库名称
  database:'two',
  //最大连接数据
  connectionLimit:10
});
server.use(express.static('./public'))

server.use(cors());

server.use(bodyParser.urlencoded({
  extended:false
}));


// 获取所有文章分类的接口
server.get('/category',(req,res)=>{
  //查找文章分类表中的所有数据
  let sql = 'SELECT id,category_name FROM xzqa_category';
  //通过MySQL连接池执行SQL语句
  pool.query(sql,(err,results)=>{
    if(err) throw err;
    res.send({message:'查询成功',code:1,results:results});
  });
});

//获取特定分类下的文章信息的接口

server.get('/lists',(req,res)=>{
  //接收客户端传递的URL参数中的cid  -- 文章分类ID
  let cid = req.query.cid;

  //接收客户端传递的URL参数中的page -- 页码
  let page = req.query.page;

  //存储每页显示的记录数(其实pagesize就是一个纯变量,与分页没有任何关系)
  let pagesize = 15;

  //根据MySQL分页的标准计算公式计算出offset参数值,并且带入到SQL语句中
  let offset = (page - 1) * pagesize;

  //现以接收到cid为条件进行文章信息的查找,此时的pagesize才是真正的返回多少条记录呢
  let sql = 'SELECT id,subject,description,image FROM xzqa_article WHERE category_id = ? LIMIT ' + offset + ',' + pagesize;

  //存储总记录数
  let rowcount;
  //存储总页数
  let pagecount;
  
  //执行SQL查询
  pool.query(sql,[cid],(err,result)=>{
    if(err) throw err;
    /////////////////   
    //1.获取记录数
    sql = 'SELECT COUNT(id) AS count FROM xzqa_article WHERE category_id=?';
    pool.query(sql,[cid],(err,results)=>{
      if(err) throw err;    
      rowcount = results[0].count;
      //2.计算总页数
      pagecount = Math.ceil(rowcount / pagesize);
      //返回原来的查询记录的数据及总页数信息
      res.send({message:'查询成功',code:1,results:result,pagecount:pagecount});   
    });
    /////////////////
   
  })
});

server.get('/tp',(req,res)=>{
	sql = 'select * from tpsrc';
	pool.query(sql,(err,result)=>{
		if (err){
			throw err
		}
		console.log(result)
		res.send(result)
	})
})

server.get('/list',(req,res)=>{
  sql='select * from list';
  pool.query(sql,(err,result)=>{
		if (err){
			throw err
		}
		console.log(result)
		res.send(result)
	})
})

server.get('/details',(req,res)=>{
  let id = req.query.id;
  console.log(id);
  let sql = 'select * from detail where id = ?';
  pool.query(sql,[id],(err,result)=>{
		if (err){
			throw err
		}
    console.log(result)
    console.log(2)
		res.send(result)
	})
})

//获取特定文章信息的API接口
server.get('/article',(req,res)=>{
  //获取文章ID
  let id = req.query.id;

  //SQL查询 -- 多表(内)连接
  let sql = 'SELECT r.id,subject,content,created_at,nickname,avatar,article_number FROM xzqa_author AS u INNER JOIN xzqa_article  AS r ON  author_id = u.id WHERE r.id=?';
  //执行SQL语句
  pool.query(sql,[id],(err,results)=>{
    if(err) throw err;
    res.send({message:'查询成功',code:1,result:results[0]});
  });
});

server.get('/shopcar1',(req,res)=>{
  sql='select * from shopcar';
  pool.query(sql,(err,result)=>{
		if (err){
			throw err
		}
		console.log(result)
		res.send(result)
	})
})


//购物车接口
server.post('/shopcar',(req,res)=>{
  //接收用户以POST方式提交的数据
  let id = req.body.id;
  let name = req.body.name;
  let price = req.body.price;
  let src = req.body.src;
  let num =1;
  console.log("id="+id)
  console.log("name="+name)
  console.log("price="+price)
  console.log("src="+src)
  //所以先需要检测商品是否已经存在，
  console.log(id + " " + name + " " +price + " " +src + " " +num)
  let sql = 'SELECT * FROM shopcar WHERE id=?';

  pool.query(sql,[id],(error,results)=>{
    if(error) throw error;
    // 如果商品不存在，则返回空数组 -- []
    if(results.length == 0){
      //将相关的信息写入到xzqa_author数据表
      sql = 'INSERT shopcar(id,name,price,src,num) VALUES(?,?,?,?,?)';
      pool.query(sql,[id,name,price,src,num],(error,results)=>{
        if(error) throw error;
        //res.send({message: '添加成功',code:1,results});
        res.send({message: '添加成功',code:1});
      })
    }else {
      num = num + 1;
      sql = 'UPDATE shopcar SET num=? WHERE id=?';
      pool.query(sql,[num],(error,results)=>{
        if(error) throw error;
        //res.send({message: '添加成功',code:1,results});
        res.send({message: '已有商品，数量+1',code:1});
      })
    }
      //产生合理的错误信息到客户端
      // res.send({message:'添加失败',code:0});
});
});

//用户注册的接口
server.post('/register',(req,res)=>{
  //接收用户以POST方式提交的数据
  let username = req.body.username;
  let password = req.body.password;  
  //在xzqa_author数据表中username字段要保证记录的唯一性
  //所以先需要检测用户名是否已经存在，
  let sql = 'SELECT id FROM use WHERE username=?';
  
  pool.query(sql,[username],(error,results)=>{
    if(error) throw error;
    // 如果用户名不存在，则返回空数组 -- []
    // 如果用户名已存在，则返回只包含一个对象的数组,形如： [  { id: 11 } ]
    // 所以，通过数组的长度即可证明输入的用户名是否已经存在
    if(results.length == 0){
      //将相关的信息写入到xzqa_author数据表
      sql = 'INSERT use(username,password) VALUES(?,MD5(?))';
      pool.query(sql,[username,password],(error,results)=>{
        if(error) throw error;
        res.send({message: '注册成功',code:1});
      });
    } else {
      //产生合理的错误信息到客户端
      res.send({message:'注册失败',code:0});
    }
  });  
});

//用户登录的接口
server.post('/login',(req,res)=>{
  //获取用户输入的用户名和密码信息
  let username = req.body.username;
  let password = md5(req.body.password);  
  //现在要以输入的用户名和密码为条件进行查找
  let sql = 'SELECT id,username FROM use WHERE username=? AND password=?';
  pool.query(sql,[username,password],(error,results)=>{
    if(error) throw error;
    //如果找到，则代表用户登录成功
    if(results.length == 1){
      res.send({message:'登录成功',code:1,info:results[0]})
    } else { //否则代表用户登录失败
      res.send({message:'登录失败',code:0})
    }
  });
  
  
});

//Vuex的测试接口
server.get('/vuex',(req,res)=>{
  //假设数据是从数据库获取的
  let results = [
    {
      productName:'华为Mate Xs折叠屏5G手机 matexs 星际',
      salePrice:21588.00
    },
    {
      productName:'华为Mate Xs折叠屏5G手机 matexs 星际',
      salePrice:18699.00
    }
  ];
  res.send({message:'查询成功',code:1,results:results});
});

server.listen(3000,()=>{
  console.log('server is running...');
});
