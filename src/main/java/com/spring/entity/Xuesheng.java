package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "xuesheng")
public class Xuesheng implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xuehao")
    private String xuehao;
    @Column(name = "mima")
    private String mima;
    @Column(name = "xingming")
    private String xingming;
    @Column(name = "xingbie")
    private String xingbie;
    @Column(name = "banji")
    private String banji;
    @Column(name = "xueyuan")
    private String xueyuan;
    @Column(name = "banjiid")
    private Integer banjiid;

    @Column(name = "zhuanye")
    private String zhuanye;
    @Column(name = "lianxidianhua")
    private String lianxidianhua;
    @Column(name = "qqhao")
    private String qqhao;
    @Column(name = "hupingrens")
    private String hupingrens;
    @Column(name = "touxiang")
    private String touxiang;
    @Column(name = "xiangqing")
    private String xiangqing;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getChengjiCount()
    {
        return Query.make("chengji").where("xueshengid" , id).count();
    }
    public Long getXueshenghupingCount()
    {
        return Query.make("xueshenghuping").where("xueshengid" , id).count();
    }
    public String getXueyuan() {
        return xueyuan;
    }
    public void setXueyuan(String xueyuan) {
        this.xueyuan = xueyuan == null ? "" :xueyuan.trim();
    }

    public String getXuehao() {
        return xuehao;
    }
    public void setXuehao(String xuehao) {
        this.xuehao = xuehao == null ? "" : xuehao.trim();
    }
    public String getHupingrens() {
        return hupingrens;
    }
    public void setHupingrens(String hupingrens) {
        this.hupingrens = hupingrens == null ? "" : hupingrens.trim();
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

    public String getBanji() {
        return banji;
    }
    public void setBanji(String banji) {
        this.banji = banji == null ? "" : banji.trim();
    }

    public Integer getBanjiid() {
        return banjiid;
    }
    public void setBanjiid(Integer banjiid) {
        this.banjiid = banjiid;
    }


    public String getZhuanye() {
        return zhuanye;
    }
    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye == null ? "" : zhuanye.trim();
    }

    public String getLianxidianhua() {
        return lianxidianhua;
    }
    public void setLianxidianhua(String lianxidianhua) {
        this.lianxidianhua = lianxidianhua == null ? "" : lianxidianhua.trim();
    }

    public String getQqhao() {
        return qqhao;
    }
    public void setQqhao(String qqhao) {
        this.qqhao = qqhao == null ? "" : qqhao.trim();
    }

    public String getTouxiang() {
        return touxiang;
    }
    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? "" : touxiang.trim();
    }

    public String getXiangqing() {
        return xiangqing;
    }
    public void setXiangqing(String xiangqing) {
        this.xiangqing = xiangqing == null ? "" : xiangqing.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
