package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "banji")
public class Banji implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xueyuan")
    private String xueyuan;
    @Column(name = "zhuanye")
    private String zhuanye;
    @Column(name = "banjimingcheng")
    private String banjimingcheng;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXueyuan() {
        return xueyuan;
    }
    public void setXueyuan(String xueyuan) {
        this.xueyuan = xueyuan == null ? "" : xueyuan.trim();
    }

    public String getZhuanye() {
        return zhuanye;
    }
    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye == null ? "" : zhuanye.trim();
    }

    public String getBanjimingcheng() {
        return banjimingcheng;
    }
    public void setBanjimingcheng(String banjimingcheng) {
        this.banjimingcheng = banjimingcheng == null ? "" : banjimingcheng.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
