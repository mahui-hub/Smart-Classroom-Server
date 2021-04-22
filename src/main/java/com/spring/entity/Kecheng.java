package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "kecheng")
public class Kecheng implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "kechengbianhao")
    private String kechengbianhao;
    @Column(name = "kechengmingcheng")
    private String kechengmingcheng;
    @Column(name = "kechengleixing")
    private String kechengleixing;
    @Column(name = "tupian")
    private String tupian;
    @Column(name = "banjiid")
    private Integer banjiid;
    @Column(name = "jiaoshiid")
    private Integer jiaoshiid;
    @Column(name = "banjimingcheng")
    private String banjimingcheng;
    @Column(name = "kechengjieshao")
    private String kechengjieshao;
    @Column(name = "kechengshipin")
    private String kechengshipin;
    @Column(name = "kechengwendang")
    private String kechengwendang;
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

    public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public String getKechengwendang() {
        return kechengwendang;
    }
    public void setKechengwendang(String kechengwendang) {
        this.kechengwendang = kechengwendang == null ? "" : kechengwendang.trim();
    }

    public String getKechengshipin() {
        return kechengshipin;
    }
    public void setKechengshipin(String kechengshipin) {
        this.kechengshipin = kechengshipin == null ? "" : kechengshipin.trim();
    }

    public Integer getBanjiId() {
        return banjiid;
    }

    public void setBanjiId(Integer banjiid) {
        this.banjiid = banjiid;
    }


    public Integer getJiaoshiid() {
        return jiaoshiid;
    }
    public void setJiaoshiid(Integer jiaoshiid) {
        this.jiaoshiid = jiaoshiid;
    }

    public String getBanjimingcheng() {
        return banjimingcheng;
    }
    public void setBanjimingcheng(String banjimingcheng) {
        this.banjimingcheng = banjimingcheng == null ? "" : banjimingcheng.trim();
    }

    public String getKechengjieshao() {
        return kechengjieshao;
    }
    public void setKechengjieshao(String kechengjieshao) {
        this.kechengjieshao = kechengjieshao == null ? "" : kechengjieshao.trim();
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
