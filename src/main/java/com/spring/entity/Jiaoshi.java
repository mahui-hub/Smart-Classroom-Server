package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "jiaoshi")
public class Jiaoshi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "gonghao")
    private String gonghao;
    @Column(name = "mima")
    private String mima;
    @Column(name = "xingming")
    private String xingming;
    @Column(name = "xingbie")
    private String xingbie;
    @Column(name = "qqhao")
    private String qqhao;
    @Column(name = "shouji")
    private String shouji;
    @Column(name = "suojiaobanji")
    private String suojiaobanji;
    @Column(name = "xiangqing")
    private String xiangqing;
    @Column(name = "xueyuan")
    private String xueyuan;
    @Column(name = "zhicheng")
    private String zhicheng;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getGonghao() {
        return gonghao;
    }
    public void setGonghao(String gonghao) {
        this.gonghao = gonghao == null ? "" : gonghao.trim();
    }

    public String getMima() {
        return mima;
    }
    public void setMima(String mima) {
        this.mima = mima == null ? "" : mima.trim();
    }

    public String getXingming() {
        return xingming;
    }
    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getXingbie() {
        return xingbie;
    }
    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? "" : xingbie.trim();
    }

    public String getQqhao() {
        return qqhao;
    }
    public void setQqhao(String qqhao) {
        this.qqhao = qqhao == null ? "" : qqhao.trim();
    }

    public String getShouji() {
        return shouji;
    }
    public void setShouji(String shouji) {
        this.shouji = shouji == null ? "" : shouji.trim();
    }

    public String getSuojiaobanji() {
        return suojiaobanji;
    }
    public void setSuojiaobanji(String suojiaobanji) {
        this.suojiaobanji = suojiaobanji == null ? "" : suojiaobanji.trim();
    }

    public String getXiangqing() {
        return xiangqing;
    }
    public void setXiangqing(String xiangqing) {
        this.xiangqing = xiangqing == null ? "" : xiangqing.trim();
    }

    public String getXueyuan() {
        return xueyuan;
    }
    public void setXueyuan(String xueyuan) {
        this.xueyuan = xueyuan == null ? "" : xueyuan.trim();
    }

    public String getZhicheng() {
        return zhicheng;
    }
    public void setZhicheng(String zhicheng) {
        this.zhicheng = zhicheng == null ? "" : zhicheng.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
