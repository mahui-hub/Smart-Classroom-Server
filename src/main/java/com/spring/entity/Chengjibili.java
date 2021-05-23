package com.spring.entity;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "chengjibili")
public class Chengjibili implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;
    @Column(name = "kechengid")
    private Integer kechengid;

    @Column(name = "qimochengji")
    private String qimochengji;
    @Column(name = "shenghupingchengji")
    private String shenghupingchengji;
    @Column(name = "suitangceshichengji")
    private String suitangceshichengji;
    @Column(name = "jiaoshipingjiachengji")
    private String jiaoshipingjiachengji;
    @Column(name = "qiangdawentichengji")
    private String qiangdawentichengji;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getKechengid() {
        return kechengid;
    }
    public void setKechengid(Integer kechengid) {
        this.kechengid = kechengid;
    }

    public String getShenghupingchengji() {
        return shenghupingchengji;
    }
    public void setShenghupingchengji(String shenghupingchengji) {
        this.shenghupingchengji = shenghupingchengji == null ? "" : shenghupingchengji.trim();
    }

    public String getJiaoshipingjiachengji() {
        return jiaoshipingjiachengji;
    }
    public void setJiaoshipingjiachengji(String jiaoshipingjiachengji) {
        this.jiaoshipingjiachengji = jiaoshipingjiachengji == null ? "" : jiaoshipingjiachengji.trim();
    }

    public String getSuitangceshichengji() {
        return suitangceshichengji;
    }
    public void setSuitangceshichengji(String suitangceshichengji) {
        this.suitangceshichengji = suitangceshichengji == null ? "" :suitangceshichengji.trim();
    }

    public String getQiangdawentichengji() {
        return qiangdawentichengji;
    }
    public void setQiangdawentichengji(String qiangdawentichengji) {
        this.qiangdawentichengji = qiangdawentichengji == null ? "" : qiangdawentichengji.trim();
    }

    public String getQimochengji() {
        return qimochengji;
    }
    public void setQimochengji(String qimochengji) {
        this.qimochengji = qimochengji == null ? "" : qimochengji.trim();
    }


}
