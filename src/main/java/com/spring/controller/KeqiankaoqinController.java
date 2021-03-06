package com.spring.controller;

import com.spring.dao.KeqiankaoqinMapper;
import com.spring.entity.Keqiankaoqin;
import com.spring.service.KeqiankaoqinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;
import dao.CommDAO;


/**
 * 课前考勤 */
@Controller
public class KeqiankaoqinController extends BaseController
{
    @Autowired
    private KeqiankaoqinMapper dao;
    @Autowired
    private KeqiankaoqinService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/keqiankaoqin_list")
    public String list()
    {

        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据
        Example example = new Example(Keqiankaoqin.class); //  创建一个扩展搜索类
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
        List<Keqiankaoqin> list = service.selectPageExample(example , page , pagesize);   // 获取当前页的行数

        assign("qiandaorenlist" , new CommDAO().select("select qiandao.keqiankaoqinid as id,qiandao.qiandaoren as qiandaoren from qiandao;"));
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
        // 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
        if(!Request.get("kechengmingcheng").equals("")) {
            where += " AND kechengmingcheng LIKE '%"+Request.get("kechengmingcheng")+"%' ";
        }
        if(!Request.get("kechengxinxi").equals("")) {
            where += " AND kechengxinxi LIKE '%"+Request.get("kechengxinxi")+ "%' ";
        }
        if(!Request.get("kechengleixing").equals("")) {
            where += " AND kechengleixing LIKE '%"+Request.get("kechengleixing")+ "%' ";
        }
        if(!Request.get("faburen").equals("")) {
            where += " AND faburen  LIKE '%"+Request.get("faburen")+ "%' ";
        }
        return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/keqiankaoqin_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }
        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc
        int    pagesize = Request.getInt("pagesize" , 12); // 获取前台一页多少行数据


        Example example = new Example(Keqiankaoqin.class);  //  创建一个扩展搜索类
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

        List<Keqiankaoqin> list = service.selectPageExample(example , page , pagesize);
        assign("kechengleixingList" , new CommDAO().select("SELECT * FROM kechengleixing ORDER BY id desc"));        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
        assign("orderby" , order);
        assign("sort" , sort);
        return json();   // 将数据写给前端
    }

    /**
     *  前台列表页
     *
     */
    @RequestMapping("/keqiankaoqinlist")
    public String index()
    {
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Keqiankaoqin.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += getWhere();
        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
        List<Keqiankaoqin> list = service.selectPageExample(example , page , 12);
        for (int i = 0; i < list.size(); i++) {
            Keqiankaoqin keqiankaoqin = list.get(i);
            int keqiankaoqinId = keqiankaoqin.getId();
            List<HashMap> qiandaorenlist = new CommDAO().select("select qiandao.keqiankaoqinid as id,group_concat(qiandaoren separator '-')  qiandaoren from qiandao where qiandao.keqiankaoqinid="+keqiankaoqinId);
            String joiner = String.valueOf(qiandaorenlist.get(0).get("qiandaoren"));
            list.get(i).setQiandaorens(joiner);
        }
        assign("totalCount" , request.getAttribute("totalCount"));
        assign("list" , list);
        assign("where" , where);
        assign("orderby" , order);
        assign("sort" , sort);
        return json();
    }



    @RequestMapping("/keqiankaoqin_add")
    public String add()
    {
        _var = new LinkedHashMap(); // 重置数据


        return json();   // 将数据写给前端
    }

    @RequestMapping("/keqiankaoqin_updt")
    public String updt()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Keqiankaoqin mmm = service.find(id);
        assign("mmm" , mmm);
        assign("updtself" , 0);


        return json();   // 将数据写给前端
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/keqiankaoqininsert")
    public String insert()
    {
        _var = new LinkedHashMap(); // 重置数据
        String tmp="";
        Keqiankaoqin post = new Keqiankaoqin();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setKechengxinxi(Request.getInt("kechengxinxi"));

        post.setKechengbianhao(Request.get("kechengbianhao"));

        post.setKechengmingcheng(Request.get("kechengmingcheng"));

        post.setKechengleixing(Request.get("kechengleixing"));

        post.setKaishishijian(Request.get("kaishishijian"));

        post.setJieshushijian(Request.get("jieshushijian"));

        post.setFaburen(Request.get("faburen"));
        post.setQiandaorens(Request.get("qiandaorens"));



        post.setAddtime(Info.getDateStr()); // 设置添加时间
        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();

        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/keqiankaoqinupdate")
    public String update()
    {
        _var = new LinkedHashMap(); // 重置数据
        // 创建实体类
        Keqiankaoqin post = new Keqiankaoqin();
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
        if(!Request.get("qiandaorens").equals(""))
            post.setQiandaorens(Request.get("qiandaorens"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/keqiankaoqin_detail")
    public String detail()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Keqiankaoqin map = service.find(id);  // 根据前台url 参数中的id获取行数据
        assign("map" , map);  // 把数据写到前台
        return json();   // 将数据写给前端
    }
    /**
     *  前台详情
     */
    @RequestMapping("/keqiankaoqindetail")
    public String detailweb()
    {
        _var = new LinkedHashMap(); // 重置数据
        int id = Request.getInt("id");
        Keqiankaoqin map = service.find(id);


        assign("map" , map);
        return json();   // 将数据写给前端
    }
    /**
     *  删除
     */
    @RequestMapping("/keqiankaoqin_delete")
    public String delete()
    {
        _var = new LinkedHashMap(); // 重置数据
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("keqiankaoqin").find(id);

        service.delete(id);// 根据id 删除某行数据
        return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
