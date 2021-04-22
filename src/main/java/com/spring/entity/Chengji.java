package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "chengji")
public class Chengji implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xuehao")
    private String xuehao;
    @Column(name = "xingming")
    private String xingming;
    @Column(name = "banji")
    private String banji;
    @Column(name = "zhuanye")
    private String zhuanye;
    @Column(name = "kaoqinchengji")
    private Double kaoqinchengji;
    @Column(name = "shenghupingchengji")
    private Double shenghupingchengji;
    @Column(name = "jiaoshipingjiachengji")
    private Double jiaoshipingjiachengji;
    @Column(name = "suitangceshichengji")
    private Double suitangceshichengji;
    @Column(name = "qiangdawentichengji")
    private Double qiangdawentichengji;
    @Column(name = "zongfen")
    private Double zongfen;
    @Column(name = "tianjiaren")
    private String tianjiaren;
    private Integer xueshengid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getBanji() {
        return banji;
    }
    public void setBanji(String banji) {
        this.banji = banji == null ? "" : banji.trim();
    }

    public String getZhuanye() {
        return zhuanye;
    }
    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye == null ? "" : zhuanye.trim();
    }

    public Double getKaoqinchengji() {
        return kaoqinchengji;
    }
    public void setKaoqinchengji(Double kaoqinchengji) {
        this.kaoqinchengji = kaoqinchengji == null ? 0.0f : kaoqinchengji;
    }

    public Double getShenghupingchengji() {
        return shenghupingchengji;
    }
    public void setShenghupingchengji(Double shenghupingchengji) {
        this.shenghupingchengji = shenghupingchengji == null ? 0.0f : shenghupingchengji;
    }

    public Double getJiaoshipingjiachengji() {
        return jiaoshipingjiachengji;
    }
    public void setJiaoshipingjiachengji(Double jiaoshipingjiachengji) {
        this.jiaoshipingjiachengji = jiaoshipingjiachengji == null ? 0.0f : jiaoshipingjiachengji;
    }

    public Double getSuitangceshichengji() {
        return suitangceshichengji;
    }
    public void setSuitangceshichengji(Double suitangceshichengji) {
        this.suitangceshichengji = suitangceshichengji == null ? 0.0f : suitangceshichengji;
    }

    public Double getQiangdawentichengji() {
        return qiangdawentichengji;
    }
    public void setQiangdawentichengji(Double qiangdawentichengji) {
        this.qiangdawentichengji = qiangdawentichengji == null ? 0.0f : qiangdawentichengji;
    }

    public Double getZongfen() {
        return zongfen;
    }
    public void setZongfen(Double zongfen) {
        this.zongfen = zongfen == null ? 0.0f : zongfen;
    }

    public String getTianjiaren() {
        return tianjiaren;
    }
    public void setTianjiaren(String tianjiaren) {
        this.tianjiaren = tianjiaren == null ? "" : tianjiaren.trim();
    }
    public Integer getXueshengid() {
        return xueshengid;
    }
    public void setXueshengid(Integer xueshengid) {
        this.xueshengid = xueshengid == null ? 0 : xueshengid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
