package com.spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dao.TieziMapper;
import com.spring.entity.Tiezi;
import com.spring.service.TieziService;
import com.spring.util.SensitivewordEngine;

import dao.CommDAO;
import dao.Query;
import tk.mybatis.mapper.entity.Example;
import util.Info;
import util.Minganci;
import util.Request;


/**
 * 帖子
 */
@Controller
public class TieziController extends BaseController {
    @Autowired
    private TieziMapper dao;
    @Autowired
    private TieziService service;
    
    private static String ENCODING = "UTF-8";

    /**
     * 后台列表页
     */
    @RequestMapping("/tiezi_list")
    public String list() {

        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int pagesize = Request.getInt("pagesize", 12); // 获取前台一页多少行数据
        Example example = new Example(Tiezi.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if (sort.equals("desc")) {        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句设置成倒序
        } else {
            example.orderBy(order).asc();   // 把 sql 设置成正序
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1, page);  // 取两个数的最大值，防止page 小于1
        List<Tiezi> list = service.selectPageExample(example, page, pagesize);   // 获取当前页的行数


        assign("tiezifenleiList", new CommDAO().select("SELECT * FROM tiezifenlei ORDER BY id desc"));
        assign("tieziEcharts", new CommDAO().select("select t2.fenleimingcheng as fenlei,round(rand()*50)+1 as score,count( t1.id) as amount from tiezi t1,tiezifenlei t2 where t1.fenlei =t2.id group by t1.fenlei ORDER BY t1.fenlei desc"));
        // 将列表写给界面使用
        assign("totalCount", request.getAttribute("totalCount"));
        assign("list", list);
        assign("orderby", order);  // 把当前排序结果写进前台
        assign("sort", sort);      // 把当前排序结果写进前台

        return json();   // 将数据写给前端
    }

    public String getWhere() {
        _var = new LinkedHashMap(); // 重置数据
        String where = " ";
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
        if (!Request.get("tiezibianhao").equals("")) {
            where += " AND tiezibianhao LIKE '%" + Request.get("tiezibianhao") + "%' ";
        }
        if (!Request.get("biaoti").equals("")) {
            where += " AND biaoti LIKE '%" + Request.get("biaoti") + "%' ";
        }
        if (!Request.get("fenlei").equals("")) {
            where += " AND fenlei ='" + Request.get("fenlei") + "' ";
        }
        return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/tiezi_list_faburen")
    public String listfaburen() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }
        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int pagesize = Request.getInt("pagesize", 12); // 获取前台一页多少行数据


        Example example = new Example(Tiezi.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：发布人=当前登录用户
        String where = " faburen='" + request.getSession().getAttribute("username") + "' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if (sort.equals("desc")) {        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        } else {
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1, page); // 注释同list

        List<Tiezi> list = service.selectPageExample(example, page, pagesize);
        assign("tiezifenleiList", new CommDAO().select("SELECT * FROM tiezifenlei ORDER BY id desc"));
        assign("totalCount", request.getAttribute("totalCount"));
        assign("list", list);
        assign("orderby", order);
        assign("sort", sort);
        return json();   // 将数据写给前端
    }

    /**
     * 前台列表页
     */
    @RequestMapping("/tiezilist")
    public String index() {
        String order = Request.get("order", "id");
        String sort = Request.get("sort", "desc");

        Example example = new Example(Tiezi.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += getWhere();
        criteria.andCondition(where);
        if (sort.equals("desc")) {
            example.orderBy(order).desc();
        } else {
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1, page);
        List<Tiezi> list = service.selectPageExample(example, page, 12);

        assign("tiezifenleiList", new CommDAO().select("SELECT * FROM tiezifenlei ORDER BY id desc"));
        assign("totalCount", request.getAttribute("totalCount"));
        assign("list", list);
        assign("where", where);
        assign("orderby", order);
        assign("sort", sort);
        return json();
    }


    @RequestMapping("/tiezi_add")
    public String add() {
        _var = new LinkedHashMap(); // 重置数据

        assign("tiezifenleiList", new CommDAO().select("SELECT * FROM tiezifenlei ORDER BY id desc"));
        return json();   // 将数据写给前端
    }

    @RequestMapping("/tiezi_updt")
    public String updt() {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Tiezi mmm = service.find(id);
        assign("mmm", mmm);
        assign("updtself", 0);

        assign("tiezifenleiList", new CommDAO().select("SELECT * FROM tiezifenlei ORDER BY id desc"));
        return json();   // 将数据写给前端
    }

    /**
     * 添加内容
     *
     * @return
     */
    @RequestMapping("/tieziinsert")
    public String insert() throws Exception {
     
//        _var = new LinkedHashMap(); // 重置数据
        String tmp = "";
        

        String neirong;
		 neirong= Request.get("neirong");

		 long startTime = System.currentTimeMillis(); 
		 //初始化敏感词库，并进行敏感词替换
       Set<String> set = null;
       File file = new File("src/main/resources/keywords.txt");    //读取文件
       InputStreamReader read = new InputStreamReader(new FileInputStream(file),ENCODING);
       if(file.isFile() && file.exists()){      //文件流是否存在
           set = new HashSet<String>();
           BufferedReader bufferedReader = new BufferedReader(read);
           String txt = null;
           while((txt = bufferedReader.readLine()) != null){    //读取文件，将文件内容放入到set中
               set.add(txt);
           }}
        SensitivewordEngine.addNewSensitiveWord(set);
        System.out.println(neirong);
        System.out.println(SensitivewordEngine.sensitiveWordMap);
        
        //敏感词库初始化完成进行替换
        neirong = SensitivewordEngine.replaceSensitiveWord(neirong,2, "*");
       System.out.println(neirong);
       System.err.println(neirong);
       long endTime = System.currentTimeMillis();    //获取结束时间
       System.out.println("程序运行时间：" + (endTime - startTime) + "ms");
        
        
        
        
        
        
        
        
        Tiezi post = new Tiezi();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
   
       
        post.setTiezibianhao(Request.get("tiezibianhao"));

        post.setBiaoti(Request.get("biaoti"));

        post.setFenlei(Request.get("fenlei"));

        post.setFujian(Request.get("fujian"));

        post.setDianzanliang(Request.getInt("dianzanliang"));

        post.setTupian(Request.get("tupian"));

        post.setNeirong(util.DownloadRemoteImage.run(neirong));
        post.setNeirong(util.DownloadRemoteImage.run(neirong));

        post.setFaburen(Request.get("faburen"));


        post.setAddtime(Info.getDateStr()); // 设置添加时间
        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();

        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     *
     * @return
     */
    @RequestMapping("/tieziupdate")
    public String update() throws Exception{
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Tiezi post = new Tiezi();
        
        String neirong;
		 neirong= Request.get("neirong");

		 long startTime = System.currentTimeMillis(); 
		 //初始化敏感词库，并进行敏感词替换
      Set<String> set = null;
      File file = new File("src/main/resources/keywords.txt");    //读取文件
      InputStreamReader read = new InputStreamReader(new FileInputStream(file),ENCODING);
      if(file.isFile() && file.exists()){      //文件流是否存在
          set = new HashSet<String>();
          BufferedReader bufferedReader = new BufferedReader(read);
          String txt = null;
          while((txt = bufferedReader.readLine()) != null){    //读取文件，将文件内容放入到set中
              set.add(txt);
          }}
       SensitivewordEngine.addNewSensitiveWord(set);
       System.out.println(neirong);
       System.out.println(SensitivewordEngine.sensitiveWordMap);
       
       //敏感词库初始化完成进行替换
       neirong = SensitivewordEngine.replaceSensitiveWord(neirong,2, "*");
      System.out.println(neirong);
      System.err.println(neirong);
      long endTime = System.currentTimeMillis();    //获取结束时间
      System.out.println("程序运行时间：" + (endTime - startTime) + "ms");
        
        
        
        
        
        // 将前台表单数据填充到实体类
        if (!Request.get("tiezibianhao").equals(""))
            post.setTiezibianhao(Request.get("tiezibianhao"));
        if (!Request.get("biaoti").equals(""))
            post.setBiaoti(Request.get("biaoti"));
        if (!Request.get("fenlei").equals(""))
            post.setFenlei(Request.get("fenlei"));
        if (!Request.get("fujian").equals(""))
            post.setFujian(Request.get("fujian"));
        if (!Request.get("dianzanliang").equals(""))
            post.setDianzanliang(Request.getInt("dianzanliang"));
        if (!Request.get("tupian").equals(""))
            post.setTupian(Request.get("tupian"));
        if (!neirong.equals(""))
            post.setNeirong(util.DownloadRemoteImage.run(neirong));
        if (!Request.get("faburen").equals(""))
            post.setFaburen(Request.get("faburen"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }

    /**
     * 后台详情
     */
    @RequestMapping("/tiezi_detail")
    public String detail() {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Tiezi map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map", map);  // 把数据写到前台
        return json();   // 将数据写给前端
    }

    /**
     * 前台详情
     */
    @RequestMapping("/tiezidetail")
    public String detailweb() {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Tiezi map = service.find(id);
        assign("user", Query.make("xuesheng").where("xuehao", map.getFaburen()).find());
        Minganci minganci = new Minganci();

        map.setNeirong(minganci.filter(map.getNeirong()));
        List<HashMap> replyList = Query.make("tiezihuifu").where("tieziid", id).order("id desc").select(); // 获取回复列表
        for (HashMap m : replyList) {
            Object yonghu = m.get("huifuren");
            HashMap user = Query.make("xuesheng").where("xuehao", yonghu).find();
            m.put("huifuneirong" , minganci.filter((String) m.get("huifuneirong")));
            m.put("user", user);
        }
        assign("replyList", replyList); // 给前台回复显示回复数据

        assign("map", map);
        return json();   // 将数据写给前端
    }

    /**
     * 删除
     */
    @RequestMapping("/tiezi_delete")
    public String delete() {
        _var = new LinkedHashMap(); // 重置数据
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("tiezi").find(id);

        service.delete(id);// 根据id 删除某行数据
        return showSuccess("删除成功", request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
