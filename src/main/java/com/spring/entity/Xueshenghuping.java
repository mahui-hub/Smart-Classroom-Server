package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "xueshenghuping")
public class Xueshenghuping implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;
    @Column(name = "kechengid")
    private Integer kechengid;
    @Column(name = "banjiid")
    private Integer banjiid;
    @Column(name = "xuehao")
    private String xuehao;
    @Column(name = "xingming")
    private String xingming;

    @Column(name = "hupingfenshu")
    private Double hupingfenshu;
    @Column(name = "hupingren")
    private String hupingren;
    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getKechengid() {
        return  kechengid;
    }
    public void setKechengid(Integer kechengid) {
        this. kechengid =  kechengid;
    }

    public Integer getBanjiid() {
        return  banjiid;
    }
    public void setBanjiid(Integer banjiid) {
        this. banjiid =  banjiid;
    }

    public String getXuehao() {
        return xuehao;
    }
    public void setXuehao(String xuehao) {
        this.xuehao = xuehao == null ? "" : xuehao.trim();
    }


    public String getXingming() {
        return xingming;
    }
    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }


    public Double getHupingfenshu() {
        return hupingfenshu;
    }
    public void setHupingfenshu(Double hupingfenshu) {
        this.hupingfenshu = hupingfenshu == null ? 0.0f : hupingfenshu;
    }

    public String getHupingren() {
        return hupingren;
    }
    public void setHupingren(String hupingren) {
        this.hupingren = hupingren == null ? "" : hupingren.trim();
    }
    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
