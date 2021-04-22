package com.spring.controller;

import com.spring.dao.ChengjiMapper;
import com.spring.entity.Chengji;
import com.spring.service.ChengjiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;

import com.spring.entity.Xuesheng;
import com.spring.service.XueshengService;

/**
 * 成绩 */
@Controller
public class ChengjiController extends BaseController
{
    @Autowired
    private ChengjiMapper dao;
    @Autowired
    private ChengjiService service;

    @Autowired
    private XueshengService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/chengji_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Chengji.class); //  创建一个扩展搜索类
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
        List<Chengji> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数
        // 生成统计语句
        HashMap total = Query.make("chengji").field("(sum(zongfen)) sum_zongfen,(avg(zongfen)) avg_zongfen,(min(zongfen)) min_zongfen,(max(zongfen)) max_zongfen").where(where).find();
        // 将统计语句写给界面调用
        assign("total" , total);


                    assign("banjiList" , new CommDAO().select("SELECT * FROM banji ORDER BY id desc"));
            assign("zhuanyeList" , new CommDAO().select("SELECT * FROM zhuanye ORDER BY id desc"));
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
        // 判断URL 参数xueshengid是否大于0
        if( Request.getInt("xueshengid") > 0 ) {
            // 大于0 则写入条件
            where += " AND xueshengid='"+Request.getInt("xueshengid")+"' ";
        }
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
            if(!Request.get("xuehao").equals("")) {
            where += " AND xuehao LIKE '%"+Request.get("xuehao")+"%' ";
        }
                if(!Request.get("xingming").equals("")) {
            where += " AND xingming LIKE '%"+Request.get("xingming")+"%' ";
        }
                if(!Request.get("banji").equals("")) {
            where += " AND banji ='"+Request.get("banji")+"' ";
        }
                if(!Request.get("zhuanye").equals("")) {
            where += " AND zhuanye ='"+Request.get("zhuanye")+"' ";
        }
            return where;
    }

    /**
     * 学号列表
     */
    @RequestMapping("/chengji_list_xuehao")
    public String listxuehao()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Chengji.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：学号=当前登录用户
        String where = " xuehao='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Chengji> list = service.selectPageExample(example , page , pagesize);
                HashMap total = Query.make("chengji").field("(sum(zongfen)) sum_zongfen,(avg(zongfen)) avg_zongfen,(min(zongfen)) min_zongfen,(max(zongfen)) max_zongfen").where(where).find();
        assign("total" , total);
                    assign("banjiList" , new CommDAO().select("SELECT * FROM banji ORDER BY id desc"));
            assign("zhuanyeList" , new CommDAO().select("SELECT * FROM zhuanye ORDER BY id desc"));        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }
    /**
     * 添加人列表
     */
    @RequestMapping("/chengji_list_tianjiaren")
    public String listtianjiaren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Chengji.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：添加人=当前登录用户
        String where = " tianjiaren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Chengji> list = service.selectPageExample(example , page , pagesize);
                HashMap total = Query.make("chengji").field("(sum(zongfen)) sum_zongfen,(avg(zongfen)) avg_zongfen,(min(zongfen)) min_zongfen,(max(zongfen)) max_zongfen").where(where).find();
        assign("total" , total);
                    assign("banjiList" , new CommDAO().select("SELECT * FROM banji ORDER BY id desc"));
            assign("zhuanyeList" , new CommDAO().select("SELECT * FROM zhuanye ORDER BY id desc"));        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }




        @RequestMapping("/chengji_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");  // 根据id 获取 学生模块中的数据
        Xuesheng readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        assign("readMap" , readMap);

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/chengji_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Chengji mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/chengjiinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Chengji post = new Chengji();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setXuehao(Request.get("xuehao"));

        post.setXingming(Request.get("xingming"));

        post.setBanji(Request.get("banji"));

        post.setZhuanye(Request.get("zhuanye"));

        post.setKaoqinchengji(Request.getDouble("kaoqinchengji"));

        post.setShenghupingchengji(Request.getDouble("shenghupingchengji"));

        post.setJiaoshipingjiachengji(Request.getDouble("jiaoshipingjiachengji"));

        post.setSuitangceshichengji(Request.getDouble("suitangceshichengji"));

        post.setQiangdawentichengji(Request.getDouble("qiangdawentichengji"));

        post.setZongfen(Request.getDouble("zongfen"));

        post.setTianjiaren(Request.get("tianjiaren"));

        post.setXueshengid(Request.getInt("xueshengid"));

        
        post.setAddtime(Info.getDateStr()); // 设置添加时间
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("UPDATE chengji SET zongfen=(kaoqinchengji+shenghupingchengji+jiaoshipingjiachengji+suitangceshichengji+qiangdawentichengji) WHERE id='"+charuid+"'");



        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/chengjiupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Chengji post = new Chengji();
        // 将前台表单数据填充到实体类
        if(!Request.get("xuehao").equals(""))
        post.setXuehao(Request.get("xuehao"));
                if(!Request.get("xingming").equals(""))
        post.setXingming(Request.get("xingming"));
                if(!Request.get("banji").equals(""))
        post.setBanji(Request.get("banji"));
                if(!Request.get("zhuanye").equals(""))
        post.setZhuanye(Request.get("zhuanye"));
                if(!Request.get("kaoqinchengji").equals(""))
        post.setKaoqinchengji(Request.getDouble("kaoqinchengji"));
            if(!Request.get("shenghupingchengji").equals(""))
        post.setShenghupingchengji(Request.getDouble("shenghupingchengji"));
            if(!Request.get("jiaoshipingjiachengji").equals(""))
        post.setJiaoshipingjiachengji(Request.getDouble("jiaoshipingjiachengji"));
            if(!Request.get("suitangceshichengji").equals(""))
        post.setSuitangceshichengji(Request.getDouble("suitangceshichengji"));
            if(!Request.get("qiangdawentichengji").equals(""))
        post.setQiangdawentichengji(Request.getDouble("qiangdawentichengji"));
            if(!Request.get("zongfen").equals(""))
        post.setZongfen(Request.getDouble("zongfen"));
            if(!Request.get("tianjiaren").equals(""))
        post.setTianjiaren(Request.get("tianjiaren"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        Query.execute("UPDATE chengji SET zongfen=(kaoqinchengji+shenghupingchengji+jiaoshipingjiachengji+suitangceshichengji+qiangdawentichengji) WHERE id='"+request.getParameter("id")+"'");


                return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/chengji_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Chengji map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
            return json();   // 将数据写给前端
    }
        /**
    *  删除
    */
    @RequestMapping("/chengji_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("chengji").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
