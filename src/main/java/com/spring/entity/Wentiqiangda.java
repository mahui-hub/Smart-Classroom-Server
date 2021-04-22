package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "wentiqiangda")
public class Wentiqiangda implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "bianhao")
    private String bianhao;
    @Column(name = "biaoti")
    private String biaoti;
    @Column(name = "tupian")
    private String tupian;
    @Column(name = "qiangdarenshu")
    private Integer qiangdarenshu;
    @Column(name = "yiqiangrenshu")
    private Integer yiqiangrenshu;
    @Column(name = "fujian")
    private String fujian;
    @Column(name = "xiangqing")
    private String xiangqing;
    @Column(name = "faburen")
    private String faburen;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getQiangdawentiCount()
    {
        return Query.make("qiangdawenti").where("wentiqiangdaid" , id).count();
    }


    public String getBianhao() {
        return bianhao;
    }
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
    }

    public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public Integer getQiangdarenshu() {
        return qiangdarenshu;
    }
    public void setQiangdarenshu(Integer qiangdarenshu) {
        this.qiangdarenshu = qiangdarenshu == null ? 0 : qiangdarenshu;
    }

    public Integer getYiqiangrenshu() {
        return yiqiangrenshu;
    }
    public void setYiqiangrenshu(Integer yiqiangrenshu) {
        this.yiqiangrenshu = yiqiangrenshu == null ? 0 : yiqiangrenshu;
    }

    public String getFujian() {
        return fujian;
    }
    public void setFujian(String fujian) {
        this.fujian = fujian == null ? "" : fujian.trim();
    }

    public String getXiangqing() {
        return xiangqing;
    }
    public void setXiangqing(String xiangqing) {
        this.xiangqing = xiangqing == null ? "" : xiangqing.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
