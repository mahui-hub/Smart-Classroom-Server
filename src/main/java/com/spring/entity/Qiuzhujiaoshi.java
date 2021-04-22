package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "qiuzhujiaoshi")
public class Qiuzhujiaoshi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "laoshixingming")
    private String laoshixingming;
    @Column(name = "kemu")
    private String kemu;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getLaoshixingming() {
        return laoshixingming;
    }
    public void setLaoshixingming(String laoshixingming) {
        this.laoshixingming = laoshixingming == null ? "" : laoshixingming.trim();
    }

    public String getKemu() {
        return kemu;
    }
    public void setKemu(String kemu) {
        this.kemu = kemu == null ? "" : kemu.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
