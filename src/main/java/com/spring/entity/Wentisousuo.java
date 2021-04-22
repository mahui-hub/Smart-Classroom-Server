package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "wentisousuo")
public class Wentisousuo implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "kechengmingcheng")
    private String kechengmingcheng;
    @Column(name = "wentibiaoti")
    private String wentibiaoti;
    @Column(name = "wentineirong")
    private String wentineirong;
    @Column(name = "dayineirong")
    private String dayineirong;
    @Column(name = "xuehao")
    private String xuehao;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getKechengmingcheng() {
        return kechengmingcheng;
    }
    public void setKechengmingcheng(String kechengmingcheng) {
        this.kechengmingcheng = kechengmingcheng == null ? "" : kechengmingcheng.trim();
    }

    public String getWentibiaoti() {
        return wentibiaoti;
    }
    public void setWentibiaoti(String wentibiaoti) {
        this.wentibiaoti = wentibiaoti == null ? "" : wentibiaoti.trim();
    }

    public String getWentineirong() {
        return wentineirong;
    }
    public void setWentineirong(String wentineirong) {
        this.wentineirong = wentineirong == null ? "" : wentineirong.trim();
    }

    public String getDayineirong() {
        return dayineirong;
    }
    public void setDayineirong(String dayineirong) {
        this.dayineirong = dayineirong == null ? "" : dayineirong.trim();
    }

    public String getXuehao() {
        return xuehao;
    }
    public void setXuehao(String xuehao) {
        this.xuehao = xuehao == null ? "" : xuehao.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
