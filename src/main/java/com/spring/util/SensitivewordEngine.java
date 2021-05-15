package com.spring.util;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @description:敏感词工具
 * @author: maojialong
 * @date: 2018年1月30日 上午10:59:24
 */
public class SensitivewordEngine {
    
    private String ENCODING = "GBK";    //字符编码
    
    //敏感词库
    public static Map sensitiveWordMap = new HashMap();

    //只过滤最小敏感词
    public static int minMatchTYpe = 1;

    //过滤所有敏感词
    public static int maxMatchType = 2;
    
    //正则表达式中文、字母、数字
    public static Pattern pattern = Pattern.compile("^[a-zA-Z0-9\u4E00-\u9FA5]+$");
    
    /**
     * 读取敏感词库中的内容，将内容添加到set集合中
     * @author chenming 
     * @date 2014年4月20日 下午2:31:18
     * @return
     * @version 1.0
     * @throws Exception 
     */
    @SuppressWarnings("resource")
    private void readSensitiveWordFile() throws Exception{
        Set<String> set = null;
        
        File file = new File("D:\\SensitiveWord.txt");    //读取文件
        InputStreamReader read = new InputStreamReader(new FileInputStream(file),ENCODING);
        try {
            if(file.isFile() && file.exists()){      //文件流是否存在
                set = new HashSet<String>();
                BufferedReader bufferedReader = new BufferedReader(read);
                String txt = null;
                while((txt = bufferedReader.readLine()) != null){    //读取文件，将文件内容放入到set中
                    set.add(txt);
                }
            }
            else{         //不存在抛出异常信息
                throw new Exception("敏感词库文件不存在");
            }
        } catch (Exception e) {
            throw e;
        }finally{
            read.close();     //关闭文件流
        }
        addNewSensitiveWord(set);
    }
    
    /**
     * @description: 新增敏感词库
     * @author: maojialong
     * @date: 2018年2月1日 上午11:55:10
     * @param keyWordSet
     */
    public static void addNewSensitiveWord(Set<String> keyWordSet) {
        sensitiveWordMap.putAll(getNewSensitiveWordToHashMap(keyWordSet));
    }
    
    /**
     * @description: 封装敏感词库
     * @author: maojialong
     * @date: 2018年1月30日 下午4:28:58
     * @param keyWordSet
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static HashMap getNewSensitiveWordToHashMap(Set<String> keyWordSet) {
        // 初始化HashMap对象并控制容器的大小
        HashMap newSensitiveWordMap = new HashMap(keyWordSet.size());
        // 敏感词
        String key = null;
        // 用来按照相应的格式保存敏感词库数据
        Map nowMap = null;
        // 用来辅助构建敏感词库
        Map<String, String> newWorMap = null;
        // 使用一个迭代器来循环敏感词集合
        Iterator<String> iterator = keyWordSet.iterator();
        while (iterator.hasNext()) {
            key = iterator.next();
            // 等于敏感词库，HashMap对象在内存中占用的是同一个地址，所以此nowMap对象的变化，sensitiveWordMap对象也会跟着改变
            nowMap = sensitiveWordMap;
            for (int i = 0; i < key.length(); i++) {
                // 截取敏感词当中的字，在敏感词库中字为HashMap对象的Key键值
                char keyChar = key.charAt(i);
                //不是汉字数字字母直接跳过
                Matcher match = pattern.matcher(String.valueOf(keyChar));
                boolean matched = match.matches();
                if(!matched) {
                    continue;
                }

                // 判断这个字是否存在于敏感词库中
                Object wordMap = nowMap.get(keyChar);
                if (wordMap != null) {
                    nowMap = (Map) wordMap;
                } else {
                    newWorMap = new HashMap<String, String>();
                    newWorMap.put("isEnd", "0");
                    nowMap.put(keyChar, newWorMap);
                    nowMap = newWorMap;
                }

                // 如果该字是当前敏感词的最后一个字，则标识为结尾字
                if (i == key.length() - 1) {
                    nowMap.put("isEnd", "1");
                }
            }
        }
        return newSensitiveWordMap;
    }

    /**
     * @description: 敏感词库敏感词数量
     * @author: maojialong
     * @date: 2018年1月30日 下午4:07:20
     * @return
     */
    public static int getWordSize() {
        if (SensitivewordEngine.sensitiveWordMap == null) {
            return 0;
        }
        return SensitivewordEngine.sensitiveWordMap.size();
    }

    /**
     * @description: 是否包含敏感词
     * @author: maojialong
     * @date: 2018年1月30日 下午2:47:37
     * @param txt
     * @param matchType
     * @return
     */
    public static boolean isContaintSensitiveWord(String txt, int matchType) {
        boolean flag = false;
        for (int i = 0; i < txt.length(); i++) {
            int matchFlag = checkSensitiveWord(txt, i, matchType);
            if (matchFlag > 0) {
                flag = true;
            }
        }
        return flag;
    }

    /**
     * @description: 获取敏感词内容
     * @author: maojialong
     * @date: 2018年1月30日 下午2:47:27
     * @param txt
     * @param matchType
     * @return
     */
    public static Set<String> getSensitiveWord(String txt, int matchType) {
        Set<String> sensitiveWordList = new HashSet<String>();

        for (int i = 0; i < txt.length(); i++) {
            int length = checkSensitiveWord(txt, i, matchType);
            if (length > 0) {
                // 将检测出的敏感词保存到集合中
                sensitiveWordList.add(txt.substring(i, i + length));
                i = i + length - 1;
            }
        }

        return sensitiveWordList;
    }

    /**
     * @description: 替换敏感词
     * @author: maojialong
     * @date: 2018年1月30日 下午2:47:15
     * @param txt
     * @param matchType
     * @param replaceChar
     * @return
     */
    public static String replaceSensitiveWord(String txt, int matchType, String replaceChar) {
        String resultTxt = txt;
        Set<String> set = getSensitiveWord(txt, matchType);
        Iterator<String> iterator = set.iterator();
        String word = null;
        String replaceString = null;
        while (iterator.hasNext()) {
            word = iterator.next();
            replaceString = getReplaceChars(replaceChar, word.length());
            try {
                resultTxt = resultTxt.replaceAll(word, replaceString);
            }catch(Exception e) {
            }
        }

        return resultTxt;
    }

    /**
     * @description: 获取替换字符
     * @author: maojialong
     * @date: 2018年1月30日 下午2:46:40
     * @param replaceChar
     * @param length
     * @return
     */
    private static String getReplaceChars(String replaceChar, int length) {
        String resultReplace = replaceChar;
        for (int i = 1; i < length; i++) {
            resultReplace += replaceChar;
        }

        return resultReplace;
    }

    /**
     * @description: 检查敏感词
     * @author: maojialong
     * @date: 2018年1月30日 下午2:45:50
     * @param txt
     * @param beginIndex
     * @param matchType
     * @return
     */
    public static int checkSensitiveWord(String txt, int beginIndex, int matchType) {
        boolean flag = false;
        // 记录敏感词数量
        int matchFlag = 0;
        char word = 0;
        Map nowMap = SensitivewordEngine.sensitiveWordMap;
        for (int i = beginIndex; i < txt.length(); i++) {
            word = txt.charAt(i);
            if(matchFlag > 0 && !flag ) {
                Matcher match = pattern.matcher(String.valueOf(word));
                boolean matched = match.matches();
                if(!matched) {
                    matchFlag++;
                    continue;
                }
            }
            // 判断该字是否存在于敏感词库中
            nowMap = (Map) nowMap.get(word);
            if (nowMap != null) {
                matchFlag++;
                // 判断是否是敏感词的结尾字，如果是结尾字则判断是否继续检测
                if ("1".equals(nowMap.get("isEnd"))) {
                    flag = true;
                    // 判断过滤类型，如果是小过滤则跳出循环，否则继续循环
                    if (SensitivewordEngine.minMatchTYpe == matchType) {
                        break;
                    }
                }
            } else {
                break;
            }
        }
        if (matchFlag < 2 || !flag) {
            matchFlag = 0;
        }
        return matchFlag;
    }
    
    /**
     * @description: 删除敏感词
     * @author: maojialong
     * @date: 2018年2月1日 上午11:40:45
     * @param keyWord
     */
    public static void removeSensitiveWordToHashMap(String keyWord) {
        int length = keyWord.length();
        Map<Integer,Map> tempMap = new HashMap<Integer,Map>();
        char word = 0;
        boolean flag = false;
        Map nowMap = sensitiveWordMap;
        for(int i = 0; i < length ; i++){
            word = keyWord.charAt(i);
            Map lastMap = nowMap;
            nowMap = (Map) nowMap.get(word);     //获取指定key
            if(nowMap != null){     //存在，则判断是否为最后一个
                tempMap.put(i, lastMap);
            }else{     //不存在，直接返回
                break;
            }
            if (i == length -1 && "1".equals(nowMap.get("isEnd"))) {
                flag = true;
            }
        }
        if(flag) {
            for(int i = length - 1; i >= 0 ; i--){
                word = keyWord.charAt(i);
                nowMap = tempMap.get(i); 
                Map m = (Map) nowMap.get(word);
                boolean last = m.size() == 1 && "1".equals(m.get("isEnd")) && i == length - 1;
                boolean notLast = m.size() == 1 && "0".equals(m.get("isEnd"));
                if(last || notLast) {
                    nowMap.remove(keyWord.charAt(i));
                }else {
                    break;
                }
            }
        }
    }
  
}