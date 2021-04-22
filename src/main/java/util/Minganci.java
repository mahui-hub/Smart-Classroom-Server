package util;

import dao.Query;

import java.util.HashMap;
import java.util.Map;

public class Minganci {

    //static private String minganci = "中国,政府,傻逼,沙雕";
    //static private String xingxing = "*,**,***,****,*****,******,******,*******,********";
    private Map<String,String> word;

    public Minganci()
    {
        word = Query.make("pingbici").getColkey("tihuanci" , "guanjianzi");
    }

    public String filter(String content)
    {
        for(Map.Entry<String,String> w : word.entrySet())
        {
            String key = w.getKey();
            String val = w.getValue();
            content = content.replace(key , val);
        }
        return content;
    }

}
