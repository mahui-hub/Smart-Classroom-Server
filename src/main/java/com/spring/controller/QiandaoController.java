package com.spring.controller;

import com.spring.dao.QiandaoMapper;
import com.spring.entity.Qiandao;
import com.spring.service.QiandaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;

import com.spring.entity.Keqiankaoqin;
import com.spring.service.KeqiankaoqinService;

/**
 * 签到 */
@Controller
public class QiandaoController extends BaseController
{
    @Autowired
    private QiandaoMapper dao;
    @Autowired
    private QiandaoService service;

    @Autowired
    private KeqiankaoqinService serviceRead;
    /**
     *  后台列表页
     *
     */
    @RequestMapping("/qiandao_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Qiandao.class); //  创建一个扩展搜索类
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
        List<Qiandao> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数


                    assign("kechengleixingList" , new CommDAO().select("SELECT * FROM kechengleixing ORDER BY id desc"));
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
        // 判断URL 参数keqiankaoqinid是否大于0
        if( Request.getInt("keqiankaoqinid") > 0 ) {
            // 大于0 则写入条件
            where += " AND keqiankaoqinid='"+Request.getInt("keqiankaoqinid")+"' ";
        }
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
            if(!Request.get("kechengxinxi").equals("")) {
            where += " AND kechengxinxi LIKE '%"+Request.get("kechengxinxi")+"%' ";
        }
                if(!Request.get("kechengbianhao").equals("")) {
            where += " AND kechengbianhao LIKE '%"+Request.get("kechengbianhao")+"%' ";
        }
                if(!Request.get("kechengmingcheng").equals("")) {
            where += " AND kechengmingcheng LIKE '%"+Request.get("kechengmingcheng")+"%' ";
        }
                if(!Request.get("kechengleixing").equals("")) {
            where += " AND kechengleixing ='"+Request.get("kechengleixing")+"' ";
        }
                if(!Request.get("kaishishijian_start").equals("")) {
            where += " AND kaishishijian >='"+Request.get("kaishishijian_start")+"' ";
        }
        if(!Request.get("kaishishijian_end").equals("")) {
            where += " AND kaishishijian <= '"+Request.get("kaishishijian_end")+"' ";
        }
                if(!Request.get("jieshushijian_start").equals("")) {
            where += " AND jieshushijian >='"+Request.get("jieshushijian_start")+"' ";
        }
        if(!Request.get("jieshushijian_end").equals("")) {
            where += " AND jieshushijian <= '"+Request.get("jieshushijian_end")+"' ";
        }
                if(!Request.get("qiandaoshijian_start").equals("")) {
            where += " AND qiandaoshijian >='"+Request.get("qiandaoshijian_start")+"' ";
        }
        if(!Request.get("qiandaoshijian_end").equals("")) {
            where += " AND qiandaoshijian <= '"+Request.get("qiandaoshijian_end")+"' ";
        }
                if(!Request.get("qiandaoren").equals("")) {
            where += " AND qiandaoren LIKE '%"+Request.get("qiandaoren")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/qiandao_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Qiandao.class);  //  创建一个扩展搜索类
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

            List<Qiandao> list = service.selectPageExample(example , page , pagesize);
                        assign("kechengleixingList" , new CommDAO().select("SELECT * FROM kechengleixing ORDER BY id desc"));        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }
    /**
     * 签到人列表
     */
    @RequestMapping("/qiandao_list_qiandaoren")
    public String listqiandaoren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据

        
        Example example = new Example(Qiandao.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：签到人=当前登录用户
        String where = " qiandaoren='"+request.getSession().getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Qiandao> list = service.selectPageExample(example , page , pagesize);
                        assign("kechengleixingList" , new CommDAO().select("SELECT * FROM kechengleixing ORDER BY id desc"));        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }




        @RequestMapping("/qiandao_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");  // 根据id 获取 课前考勤模块中的数据
        Keqiankaoqin readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        assign("readMap" , readMap);

        
        return json();   // 将数据写给前端
    }

    @RequestMapping("/qiandao_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Qiandao mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);

        
        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/qiandaoinsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Qiandao post = new Qiandao();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setKechengxinxi(Request.getInt("kechengxinxi"));

        post.setKechengbianhao(Request.get("kechengbianhao"));

        post.setKechengmingcheng(Request.get("kechengmingcheng"));

        post.setKechengleixing(Request.get("kechengleixing"));

        post.setKaishishijian(Request.get("kaishishijian"));

        post.setJieshushijian(Request.get("jieshushijian"));

        post.setFaburen(Request.get("faburen"));

        post.setQiandaoshijian(Request.get("qiandaoshijian"));

        post.setQiandaoren(Request.get("qiandaoren"));

        post.setKeqiankaoqinid(Request.getInt("keqiankaoqinid"));

        
        post.setAddtime(Info.getDateStr()); // 设置添加时间
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/qiandaoupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Qiandao post = new Qiandao();
        // 将前台表单数据填充到实体类
        if(!Request.get("kechengxinxi").equals(""))
        post.setKechengxinxi(Request.getInt("kechengxinxi"));
            if(!Request.get("kechengbianhao").equals(""))
        post.setKechengbianhao(Request.get("kechengbianhao"));
                if(!Request.get("kechengmingcheng").equals(""))
        post.setKechengmingcheng(Request.get("kechengmingcheng"));
                if(!Request.get("kechengleixing").equals(""))
        post.setKechengleixing(Request.get("kechengleixing"));
                if(!Request.get("kaishishijian").equals(""))
        post.setKaishishijian(Request.get("kaishishijian"));
                if(!Request.get("jieshushijian").equals(""))
        post.setJieshushijian(Request.get("jieshushijian"));
                if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
                if(!Request.get("qiandaoshijian").equals(""))
        post.setQiandaoshijian(Request.get("qiandaoshijian"));
                if(!Request.get("qiandaoren").equals(""))
        post.setQiandaoren(Request.get("qiandaoren"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
                        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/qiandao_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Qiandao map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
            return json();   // 将数据写给前端
    }
        /**
    *  删除
    */
    @RequestMapping("/qiandao_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("qiandao").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
