package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "keqiankaoqin")
public class Keqiankaoqin implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "kechengxinxi")
    private Integer kechengxinxi;
    @Column(name = "kechengbianhao")
    private String kechengbianhao;
    @Column(name = "kechengmingcheng")
    private String kechengmingcheng;
    @Column(name = "kechengleixing")
    private String kechengleixing;
    @Column(name = "kaishishijian")
    private String kaishishijian;
    @Column(name = "jieshushijian")
    private String jieshushijian;
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

    public Long getQiandaoCount()
    {
        return Query.make("qiandao").where("keqiankaoqinid" , id).count();
    }


    public Integer getKechengxinxi() {
        return kechengxinxi;
    }
    public void setKechengxinxi(Integer kechengxinxi) {
        this.kechengxinxi = kechengxinxi == null ? 0 : kechengxinxi;
    }

    public String getKechengbianhao() {
        return kechengbianhao;
    }
    public void setKechengbianhao(String kechengbianhao) {
        this.kechengbianhao = kechengbianhao == null ? "" : kechengbianhao.trim();
    }

    public String getKechengmingcheng() {
        return kechengmingcheng;
    }
    public void setKechengmingcheng(String kechengmingcheng) {
        this.kechengmingcheng = kechengmingcheng == null ? "" : kechengmingcheng.trim();
    }

    public String getKechengleixing() {
        return kechengleixing;
    }
    public void setKechengleixing(String kechengleixing) {
        this.kechengleixing = kechengleixing == null ? "" : kechengleixing.trim();
    }

    public String getKaishishijian() {
        return kaishishijian;
    }
    public void setKaishishijian(String kaishishijian) {
        this.kaishishijian = kaishishijian == null ? "" : kaishishijian.trim();
    }

    public String getJieshushijian() {
        return jieshushijian;
    }
    public void setJieshushijian(String jieshushijian) {
        this.jieshushijian = jieshushijian == null ? "" : jieshushijian.trim();
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
