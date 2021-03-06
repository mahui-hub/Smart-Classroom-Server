package com.spring.controller;


import com.spring.dao.KechengziyuanMapper;
import com.spring.entity.Kechengziyuan;
import com.spring.service.KechengziyuanService;
import dao.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Info;
import util.Request;

import java.sql.Array;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import dao.CommDAO;

@Controller
public class KechengziyuanController extends BaseController {
    @Autowired
    private KechengziyuanMapper dao;
    @Autowired
    private KechengziyuanService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/kechengziyuan_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Kechengziyuan.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if(sort.equals("desc")){        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句设置成倒序
        }else{
            example.orderBy(order).asc();   // 把 sql 设置成正序
        }
        int page = request.getParameter( "page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1 , page);  // 取两个数的最大值，防止page 小于1
        int kechengid = Request.getInt("kechengid"); // 获取前台kechengid
//        List<Kechengziyuan> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数
        // 将列表写给界面使用

        assign("list" ,new CommDAO().select("select * from kechengziyuan where kechengid = "+kechengid));
        assign("totalCount" , request.getAttribute("totalCount"));
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        return json();   // 将数据写给前端
    }

    public String getWhere()
    {
        _var = new LinkedHashMap(); // 重置数据
        String where = " ";
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
        if (!Request.get("kechengmingcheng").equals("")) {
            where += " AND kechengmingcheng LIKE '%" + Request.get("kechengmingcheng") + "%' ";
        }
        if (!Request.get("faburen").equals("")) {
            where += " AND faburen LIKE '%" + Request.get("faburen") + "%' ";
        }
        if (!Request.get("kechengid").equals("")) {
            where += " AND kechengid LIKE '%" + Request.get("kechengid") + "%' ";
        }
        if (!Request.get("kechengid").equals("")) {
            where += " kechengid = " + Request.get("kechengid");
        }
        if (!Request.get("ziyuanname").equals("")) {
            where += " AND ziyuanname LIKE '%" + Request.get("ziyuanname") + "%' ";
        }
        return where;
    }

    @RequestMapping("/kechengziyuan_echart")
    public String echart()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Kechengziyuan.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if(sort.equals("desc")){        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句设置成倒序
        }else{
            example.orderBy(order).asc();   // 把 sql 设置成正序
        }
        int page = request.getParameter( "page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1 , page);  // 取两个数的最大值，防止page 小于1
        int kechengid = Request.getInt("kechengid"); // 获取前台kechengid
//        List<HashMap> echartList = new CommDAO().select("select kechengmingcheng as name ,count(ziyuanname) as value  from kechengziyuan k where kechengid =" + kechengid +" group by kechengid");
        List<HashMap> banjiidList = new CommDAO().select("select banjiid  from kecheng where id =" + kechengid);
       String banjiid = String.valueOf(banjiidList.get(0).get("banjiid"));

//        Integer banjiid=Request.getInt("banjiid");
        // assign("list" ,new CommDAO().select("select * from kechengziyuan where kechengid="+kechengid));
        assign("echartList" ,new CommDAO().select("select kechengmingcheng as name ,count(ziyuanname) as value  from kechengziyuan k group by kechengid"));
        assign("xueshengrenshu" ,new CommDAO().select("select 'xueshengrenshu' as name ,count(xuehao) as value from xuesheng where banjiid="+banjiid));
        assign("yishangchuan" ,new CommDAO().select("select 'yishangchuan' as name, count(distinct faburen) as value from kechengziyuan where kechengid=" + kechengid+" and role = '学生'"));
        assign("wendangshu" ,new CommDAO().select("select kechengmingcheng ,faburen as name, count(fujian) as value from kechengziyuan where kechengid =" + kechengid + " group by faburen"));
//        assign("echartList" ,echartList);
        return json();   // 将数据写给前端
    }

    @RequestMapping("/kechengziyuan_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据
        return json();   // 将数据写给前端
    }

    @RequestMapping("/kechengziyuan_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Kechengziyuan mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/kechengziyuaninsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Kechengziyuan post = new Kechengziyuan();  // 创建实体类
        // 设置前台提交上来的数据到实体类中

        post.setFujian(Request.get("fujian"));
        post.setFaburen(Request.get("faburen"));
        post.setKechengid(Integer.valueOf(Request.get("kechengid")));
        post.setZiyuanname(Request.get("ziyuanname"));
        post.setKechengmingcheng(Request.get("kechengmingcheng"));
        post.setRole(Request.get("role"));
        post.setAddtime(Info.getDateStr()); // 设置添加时间

        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();

        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/kechengziyuanupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Kechengziyuan post = new Kechengziyuan();
        // 将前台表单数据填充到实体类
        if(!Request.get("kechengid").equals(""))
            post.setKechengid(Integer.valueOf(Request.get("kechengid")));
        if(!Request.get("faburen").equals(""))
            post.setFaburen(Request.get("faburen"));
        if(!Request.get("fujian").equals(""))
            post.setFujian(Request.get("fujian"));
        if(!Request.get("ziyuanname").equals(""))
            post.setZiyuanname(Request.get("ziyuanname"));
        if(!Request.get("kechengmingcheng").equals(""))
            post.setKechengmingcheng(Request.get("kechengmingcheng"));
        if(!Request.get("role").equals(""))
            post.setRole(Request.get("role"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  删除
     */
    @RequestMapping("/kechengziyuan_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("xueyuan").find(id);

        service.delete(id);// 根据id 删除某行数据
        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
