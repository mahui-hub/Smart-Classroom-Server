package com.spring.controller;

import com.spring.dao.PinglunMapper;
import com.spring.entity.Pinglun;
import com.spring.service.PinglunService;
import com.spring.util.SensitivewordEngine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.*;
import dao.CommDAO;

/**
 * 评论
 */
@Controller
public class PinglunController extends BaseController {

	@Autowired
	private PinglunMapper dao;
	@Autowired
	private PinglunService service;
	
	 private static String ENCODING = "UTF-8";
	

	
	

	/**
	 * 后台列表页
	 *
	 */
	@RequestMapping("/pinglun_list")
	public String list() {

		// 检测是否有登录，没登录则跳转到登录页面
		if (!checkLogin()) {
			return showError("尚未登录", "./login.do");
		}

		String order = Request.get("order", "id"); // 获取前台提交的URL参数 order 如果没有则设置为id
		String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort 如果没有则设置为desc
		int pagesize = Request.getInt("pagesize", 12); // 获取前台一页多少行数据
		Example example = new Example(Pinglun.class); // 创建一个扩展搜索类
		Example.Criteria criteria = example.createCriteria(); // 创建一个扩展搜索条件类
		String where = " 1=1 "; // 创建初始条件为：1=1
		where += getWhere(); // 从方法中获取url 上的参数，并写成 sql条件语句
		criteria.andCondition(where); // 将条件写进上面的扩展条件类中
		if (sort.equals("desc")) { // 判断前台提交的sort 参数是否等于 desc倒序 是则使用倒序，否则使用正序
			example.orderBy(order).desc(); // 把sql 语句设置成倒序
		} else {
			example.orderBy(order).asc(); // 把 sql 设置成正序
		}
		int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 获取前台提交的URL参数
		// page
		// 如果没有则设置为1
		page = Math.max(1, page); // 取两个数的最大值，防止page 小于1
		List<Pinglun> list = service.selectPageExample(example, page, pagesize); // 获取当前页的行数

		// 将列表写给界面使用
		assign("totalCount", request.getAttribute("totalCount"));
		assign("list", list);
		assign("orderby", order); // 把当前排序结果写进前台
		assign("sort", sort); // 把当前排序结果写进前台
		return json(); // 将数据写给前端
	}

	public String getWhere() {
		_var = new LinkedHashMap(); // 重置数据
		String where = " ";
		// 以下也是一样的操作，判断是否符合条件，符合则写入sql 语句
		return where;
	}

	/**
	 * 评论人列表
	 */
	@RequestMapping("/pinglun_list_pinglunren")
	public String listpinglunren() {
		// 检测是否有登录，没登录则跳转到登录页面
		if (!checkLogin()) {
			return showError("尚未登录", "./login.do");
		}
		String order = Request.get("order", "id"); // 获取前台提交的URL参数 order 如果没有则设置为id
		String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort 如果没有则设置为desc
		int pagesize = Request.getInt("pagesize", 12); // 获取前台一页多少行数据

		Example example = new Example(Pinglun.class); // 创建一个扩展搜索类
		Example.Criteria criteria = example.createCriteria(); // 创建一个扩展搜索条件类
		// 初始化一个条件，条件为：评论人=当前登录用户
		String where = " pinglunren='" + request.getSession().getAttribute("username") + "' ";
		where += getWhere();

		criteria.andCondition(where); // 将条件写入
		if (sort.equals("desc")) { // 注释同list
			example.orderBy(order).desc(); // 注释同list
		} else {
			example.orderBy(order).asc(); // 注释同list
		}

		int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
		page = Math.max(1, page); // 注释同list

		List<Pinglun> list = service.selectPageExample(example, page, pagesize);
		assign("totalCount", request.getAttribute("totalCount"));
		assign("list", list);
		assign("orderby", order);
		assign("sort", sort);
		return json(); // 将数据写给前端
	}

	@RequestMapping("/pinglun_add")
	public String add() {
		_var = new LinkedHashMap(); // 重置数据

		return json(); // 将数据写给前端
	}

	@RequestMapping("/pinglun_updt")
	public String updt() {
		_var = new LinkedHashMap(); // 重置数据
		int id = Request.getInt("id");
		// 获取行数据，并赋值给前台jsp页面
		Pinglun mmm = service.find(id);
		assign("mmm", mmm);
		assign("updtself", 0);

		return json(); // 将数据写给前端
	}

	
	
	

	//   是哪个位置 不执行   我这边 没有麦   可以用qq  语音
	
	/**
	 * 添加内容
	 * 
	 * @return
	 * @throws Exception 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/pingluninsert")
	public String insert() throws  Exception {
//		_var = new LinkedHashMap(); // 重置数据
		String tmp = "";
		
		 String pinglunneirong;
		 pinglunneirong= Request.get("pinglunneirong");
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
         System.out.println(pinglunneirong);
         System.out.println(SensitivewordEngine.sensitiveWordMap);      
         //敏感词库初始化完成进行替换
         pinglunneirong = SensitivewordEngine.replaceSensitiveWord(pinglunneirong,2, "*");
        System.out.println(pinglunneirong);
        System.err.println(pinglunneirong);
        long endTime = System.currentTimeMillis();    //获取结束时间
        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");
		
		

		
		Pinglun post = new Pinglun(); // 创建实体类
		// 设置前台提交上来的数据到实体类中
		post.setBiao(Request.get("biao"));

		post.setBiaoid(Request.getInt("biaoid"));

		post.setBiaoti(Request.get("biaoti"));

		post.setPingfen(Request.get("pingfen"));

		post.setPinglunneirong(pinglunneirong);

		post.setPinglunren(Request.get("pinglunren"));

		// 设置添加时间
		post.setAddtime(Info.getDateStr());

		// 插入数据
		service.insert(post);
		int charuid = post.getId().intValue();

		return showSuccess("保存成功",
				Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
	}

	

	

	/**
	 * 更新内容
	 * 
	 * @return
	 */
	@RequestMapping("/pinglunupdate")
	public String update() throws Exception {
		_var = new LinkedHashMap(); // 重置数据
		// 创建实体类
		Pinglun post = new Pinglun();
		
		 String pinglunneirong;
		 pinglunneirong= Request.get("pinglunneirong");
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
         System.out.println(pinglunneirong);
         System.out.println(SensitivewordEngine.sensitiveWordMap);      
         //敏感词库初始化完成进行替换
         pinglunneirong = SensitivewordEngine.replaceSensitiveWord(pinglunneirong,2, "*");
        System.out.println(pinglunneirong);
        System.err.println(pinglunneirong);
        long endTime = System.currentTimeMillis();    //获取结束时间
        System.out.println("程序运行时间：" + (endTime - startTime) + "ms");
		
		
		// 将前台表单数据填充到实体类
		if (!Request.get("biao").equals(""))
			post.setBiao(Request.get("biao"));
		if (!Request.get("biaoid").equals(""))
			post.setBiaoid(Request.getInt("biaoid"));
		if (!Request.get("biaoti").equals(""))
			post.setBiaoti(Request.get("biaoti"));
		if (!Request.get("pingfen").equals(""))
			post.setPingfen(Request.get("pingfen"));
		if (!pinglunneirong.equals(""))
			post.setPinglunneirong(pinglunneirong);
		if (!Request.get("pinglunren").equals(""))
			post.setPinglunren(Request.get("pinglunren"));

		post.setId(Request.getInt("id"));
		service.update(post); // 更新数据
		int charuid = post.getId().intValue();
		return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
	}

	/**
	 * 删除
	 */
	@RequestMapping("/pinglun_delete")
	public String delete() {
		_var = new LinkedHashMap(); // 重置数据
		if (!checkLogin()) {
			return showError("尚未登录");
		}
		int id = Request.getInt("id"); // 根据id 删除某行数据
		HashMap map = Query.make("pinglun").find(id);

		service.delete(id);// 根据id 删除某行数据
		return showSuccess("删除成功", request.getHeader("referer"));// 弹出删除成功，并跳回上一页
	}
}
