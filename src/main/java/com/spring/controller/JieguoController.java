package com.spring.controller;

import com.spring.dao.JieguoMapper;
import com.spring.entity.Jieguo;
import com.spring.service.JieguoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;

import com.spring.entity.Tiku;
import com.spring.service.TikuService;

/**
 * 结果 */
@Controller
public class JieguoController extends BaseController
{
    @Autowired
    private JieguoMapper dao;
    @Autowired
    private JieguoService service;

    @Autowired
    private TikuService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/jieguo_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Jieguo.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if(sort.equals("desc")){        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句设置成倒序
        }else{
            example.orderBy(order).asc();   // 把 sql 设置成正序
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1 , page);  // 取两个数的最大值，防止page 小于1
        List<Jieguo> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


        
        // 将列表写给界面使用
        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        return json();   // 将数据写给前端
    }

    public String getWhere()
    {
        _var = new LinkedHashMap(); // 重置数据
        String where = " ";
        // 判断URL 参数tikuid是否大于0
        if( Request.getInt("tikuid") > 0 ) {
            // 大于0 则写入条件
            where += " AND tikuid='"+Request.getInt("tikuid")+"' ";
        }
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
            if(!Request.get("tikumingcheng").equals("")) {
            where += " AND tikumingcheng LIKE '%"+Request.get("tikumingcheng")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/jieguo_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Jieguo.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：发布人=当前登录用户
        String where = " faburen='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Jieguo> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }
    /**
     * 考试人列表
     */
    @RequestMapping("/jieguo_list_kaoshiren")
    public String listkaoshiren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Jieguo.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：考试人=当前登录用户
        String where = " kaoshiren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Jieguo> list = service.selectPageExample(example , page , pagesize);
                    assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }




        @RequestMapping("/jieguo_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");  // 根据id 获取 题库模块中的数据
        Tiku readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        assign("readMap" , readMap);

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/jieguo_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Jieguo mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/jieguoinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Jieguo post = new Jieguo();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setTikubianhao(Request.get("tikubianhao"));

        post.setTikumingcheng(Request.get("tikumingcheng"));

        post.setFaburen(Request.get("faburen"));

        post.setKaoshibianhao(Request.get("kaoshibianhao"));

        post.setShititimu(Request.get("shititimu"));

        post.setLeixing(Request.get("leixing"));

        post.setDaan(Request.get("daan"));

        post.setDefen(Request.getDouble("defen"));

        post.setZimu(Request.get("zimu"));

        post.setKaoshiren(Request.get("kaoshiren"));

        post.setTikuid(Request.getInt("tikuid"));

        
        post.setAddtime(Info.getDateStr()); // 设置添加时间
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/jieguoupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Jieguo post = new Jieguo();
        // 将前台表单数据填充到实体类
        if(!Request.get("tikubianhao").equals(""))
        post.setTikubianhao(Request.get("tikubianhao"));
                if(!Request.get("tikumingcheng").equals(""))
        post.setTikumingcheng(Request.get("tikumingcheng"));
                if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
                if(!Request.get("kaoshibianhao").equals(""))
        post.setKaoshibianhao(Request.get("kaoshibianhao"));
                if(!Request.get("shititimu").equals(""))
        post.setShititimu(Request.get("shititimu"));
                if(!Request.get("leixing").equals(""))
        post.setLeixing(Request.get("leixing"));
                if(!Request.get("daan").equals(""))
        post.setDaan(Request.get("daan"));
                if(!Request.get("defen").equals(""))
        post.setDefen(Request.getDouble("defen"));
            if(!Request.get("zimu").equals(""))
        post.setZimu(Request.get("zimu"));
                if(!Request.get("kaoshiren").equals(""))
        post.setKaoshiren(Request.get("kaoshiren"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("UPDATE kaoshijieguo SET zongdefen=(SELECT SUM(defen) FROM jieguo WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"' AND defen>=0) WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"'");

Query.execute("UPDATE kaoshijieguo SET danxuantidefen=(SELECT SUM(defen) FROM jieguo WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"' AND leixing='单选题' AND defen>=0) WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"'");

Query.execute("UPDATE kaoshijieguo SET duoxuantidefen=(SELECT SUM(defen) FROM jieguo WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"' AND leixing='多选题' AND defen>=0) WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"'");

Query.execute("UPDATE kaoshijieguo SET tiankongtidefen=(SELECT SUM(defen) FROM jieguo WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"' AND leixing='填空题' AND defen>=0) WHERE kaoshibianhao='"+request.getParameter("kaoshibianhao")+"'");


                return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/jieguo_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Jieguo map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
            return json();   // 将数据写给前端
    }
        /**
    *  删除
    */
    @RequestMapping("/jieguo_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("jieguo").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
