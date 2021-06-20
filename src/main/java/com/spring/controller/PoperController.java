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
        int zongfen=0;
        String id = request.getParameter("id");
        List<HashMap> tikutypelist = new CommDAO().select("select tikutype from tiku where id ="+ id );
        String tikutype=String.valueOf(tikutypelist.get(0).get("tikutype"));
        if(tikutype.equals("测验题库")){
            List<HashMap> tikuxuanxiang = new CommDAO().select("select daan from shiti where tikutype=\"测验题库\" and tikuid ="+ id );
            for (int j=0;j<tikuxuanxiang.size();j++) {
                String daanlist = String.valueOf(tikuxuanxiang.get(j).get("daan"));
                JSONArray jsonArray = JSONArray.parseArray(daanlist);
                for(int z=0;z<jsonArray.size();z++){
                    JSONObject object=jsonArray.getJSONObject(z);
                    String a1=object.get("point")+"";
                    int a2=Integer.parseInt(a1);
                    zongfen=zongfen+a2;
                }
            }
        }else{
            List<HashMap> tikuxuanxiang1 = new CommDAO().select("select daan from shiti where tikutype=\"评价问卷\" and tikuid ="+ id );
            for (int j=0;j<tikuxuanxiang1.size();j++) {
                String daanlist1 = String.valueOf(tikuxuanxiang1.get(j).get("daan"));
                JSONArray jsonArray1 = JSONArray.parseArray(daanlist1);
                int max=0;
                List<Integer> list=new ArrayList<Integer>();
                for(int z=0;z<jsonArray1.size();z++){
                    JSONObject object=jsonArray1.getJSONObject(z);
                    String a1=object.get("point")+"";
                    int a2=Integer.parseInt(a1);
                    list.add(a2);
                    for (int i=0;i<list.size();i++){
                        max=list.get(0);
                        if(list.get(i)>max){
                            max=list.get(i);
                        }
                    }
                }
                zongfen=zongfen+ max;
            }
        }

        JSONArray json = JSON.parseArray(json1);
        HashMap data = new HashMap();
        String kaoshibianhao = Info.getID();

        data.put("kaoshibianhao", kaoshibianhao);
        data.put("kaoshiren", request.getSession().getAttribute("username"));
        data.put("addtime", Info.getDateStr());

        int total = 0;
        int danxuantidefen = 0;
        int duoxuantidefen = 0;

        Double zongdefen=0D;
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
        zongdefen=Double.valueOf(total)/zongfen*100;
        HashMap jieguo = new HashMap();
        jieguo.putAll(m);
        jieguo.put("zongfen", zongfen);
        jieguo.put("danxuantidefen", danxuantidefen);
        jieguo.put("duoxuantidefen", duoxuantidefen);
        jieguo.put("zongdefen", zongdefen);
      /*  jieguo.put("shifoujige", total >= 60 ? "及格" : "不及格");*/
        jieguo.put("kaoshishichang", Request.get("time"));
        long insertId = Query.make("kaoshijieguo").insert(jieguo);
        return jsonResult(insertId);
    }
}
