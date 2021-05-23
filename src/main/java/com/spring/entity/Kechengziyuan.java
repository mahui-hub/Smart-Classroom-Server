package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "kechengziyuan")
public class Kechengziyuan implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "fujian")
    private String fujian;

    @Column(name = "kechengid")
    private Integer kechengid;

    @Column(name = "ziyuanname")
    private String ziyuanname;

    @Column(name = "faburen")
    private String faburen;

    @Column(name = "kechengmingcheng")
    private String kechengmingcheng;

    @Column(name = "addtime")
    private String addtime;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getFujian() {
        return fujian;
    }
    public void setFujian(String fujian) {
        this.fujian = fujian == null ? "" : fujian.trim();
    }

    public Integer getKechengid() {
        return kechengid;
    }
    public void setKechengid(Integer kechengid) {
        this.kechengid = kechengid== null ? 0 : kechengid;
    }

    public String getKechengmingcheng() {
        return kechengmingcheng;
    }
    public void setKechengmingcheng(String kechengmingcheng) {
        this.kechengmingcheng = kechengmingcheng == null ? "" : kechengmingcheng.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getZiyuanname() {
        return ziyuanname;
    }
    public void setZiyuanname(String ziyuanname) {
        this.ziyuanname = ziyuanname == null ? "" : ziyuanname.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
