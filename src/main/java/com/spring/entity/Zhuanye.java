package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "zhuanye")
public class Zhuanye implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "zhuanyeID")
    private String zhuanyeID;

    @Column(name = "zhuanye")
    private String zhuanye;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZhuanyeID() {
        return zhuanyeID;
    }
    public void setZhuanyeID(String zhuanyeID) {
        this.zhuanyeID = zhuanyeID == null ? "" : zhuanyeID.trim();
    }

    public String getZhuanye() {
        return zhuanye;
    }
    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye == null ? "" : zhuanye.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
