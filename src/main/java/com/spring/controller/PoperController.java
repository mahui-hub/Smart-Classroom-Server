package com.spring.controller;

import com.alibaba.fastjson.*;

import java.util.*;
import dao.CommDAO;
import dao.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.*;

/**
 * 保存答题结果
 */
@Controller
public class PoperController extends BaseController{

    @RequestMapping("/savePoper")
    public String save()
    {
        if(!checkLogin())
        {
            return jsonError("尚未登录，请登录后操作");
        }

        String json1 = request.getParameter("JSON");
        String id = request.getParameter("id");
        JSONArray json = JSON.parseArray(json1);
        HashMap data = new HashMap();
        String kaoshibianhao = Info.getID();

        data.put("kaoshibianhao", kaoshibianhao);
        data.put("kaoshiren", request.getSession().getAttribute("username"));
        data.put("addtime", Info.getDateStr());

        int total = 0;
        int danxuantidefen = 0;
        int duoxuantidefen = 0;
        HashMap m = new HashMap();
        for (int i = 0; i < json.size(); i++) {
            JSONObject obj = json.getJSONObject(i);
            obj.putAll(data);
            obj.put("shitiid" , obj.get("id"));
            obj.remove("id");

            m.putAll(obj);
            int defen = obj.getIntValue("defen");// Integer.valueOf(String.valueOf(obj.get("defen"))).intValue();
            if (defen != -1) {
                if (obj.get("leixing").equals("单选题")) {
                    danxuantidefen += defen;
                }
                if (obj.get("leixing").equals("多选题")) {
                    duoxuantidefen += defen;
                }
                total += defen;
            }

            Query.make("jieguo").add(m);
        }

        HashMap jieguo = new HashMap();
        jieguo.putAll(m);

        jieguo.put("danxuantidefen", danxuantidefen);
        jieguo.put("duoxuantidefen", duoxuantidefen);
        jieguo.put("zongdefen", total);
      /*  jieguo.put("shifoujige", total >= 60 ? "及格" : "不及格");*/
        jieguo.put("kaoshishichang", Request.get("time"));
        long insertId = Query.make("kaoshijieguo").insert(jieguo);
        return jsonResult(insertId);
    }
}
