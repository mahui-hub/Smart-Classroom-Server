package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "tiezi")
public class Tiezi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "tiezibianhao")
    private String tiezibianhao;
    @Column(name = "biaoti")
    private String biaoti;
    @Column(name = "fenlei")
    private String fenlei;
    @Column(name = "fujian")
    private String fujian;
    @Column(name = "dianzanliang")
    private Integer dianzanliang;
    @Column(name = "tupian")
    private String tupian;
    @Column(name = "neirong")
    private String neirong;
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

    public Long getDianzanCount()
    {
        return Query.make("dianzan").where("tieziid" , id).count();
    }
    public Long getTiezihuifuCount()
    {
        return Query.make("tiezihuifu").where("tieziid" , id).count();
    }


    public String getTiezibianhao() {
        return tiezibianhao;
    }
    public void setTiezibianhao(String tiezibianhao) {
        this.tiezibianhao = tiezibianhao == null ? "" : tiezibianhao.trim();
    }

    public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getFenlei() {
        return fenlei;
    }
    public void setFenlei(String fenlei) {
        this.fenlei = fenlei == null ? "" : fenlei.trim();
    }

    public String getFujian() {
        return fujian;
    }
    public void setFujian(String fujian) {
        this.fujian = fujian == null ? "" : fujian.trim();
    }

    public Integer getDianzanliang() {
        return dianzanliang;
    }
    public void setDianzanliang(Integer dianzanliang) {
        this.dianzanliang = dianzanliang == null ? 0 : dianzanliang;
    }

    public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public String getNeirong() {
        return neirong;
    }
    public void setNeirong(String neirong) {
        this.neirong = neirong == null ? "" : neirong.trim();
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
