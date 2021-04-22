package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.*;

import java.util.*;

import dao.CommDAO;
import net.jntoo.db.Query;
import com.alibaba.fastjson.*;

/**
 * 首页控制器
 */
@Controller
public class IndexController extends BaseController {

    // 首页
    @RequestMapping(value = {"/", "index"})
    public String Index() {

        ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select();
        assign("bhtList", bhtList);


        ArrayList<HashMap> kechenglist1 = Query.make("kecheng").limit(4).order("id desc").select();
        assign("kechenglist1", kechenglist1);


        ArrayList<HashMap> gonggaolist2 = Query.make("gonggao").limit(1).order("id desc").select();
        assign("gonggaolist2", gonggaolist2);


        ArrayList<HashMap> tiezilist3 = Query.make("tiezi").limit(1).order("id desc").select();
        assign("tiezilist3", tiezilist3);


        ArrayList<HashMap> suitangceshilist4 = Query.make("suitangceshi").limit(1).order("id desc").select();
        assign("suitangceshilist4", suitangceshilist4);
        if (isAjax()) {
            return json();
        }
        return "index";

    }


}
