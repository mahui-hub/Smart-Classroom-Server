package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "datipingyue")
public class Datipingyue implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "bianhao")
    private String bianhao;
    @Column(name = "timu")
    private String timu;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "huidaren")
    private String huidaren;
    @Column(name = "dafen")
    private Double dafen;
    @Column(name = "beizhu")
    private String beizhu;
    private Integer datiid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getBianhao() {
        return bianhao;
    }
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
    }

    public String getTimu() {
        return timu;
    }
    public void setTimu(String timu) {
        this.timu = timu == null ? "" : timu.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getHuidaren() {
        return huidaren;
    }
    public void setHuidaren(String huidaren) {
        this.huidaren = huidaren == null ? "" : huidaren.trim();
    }

    public Double getDafen() {
        return dafen;
    }
    public void setDafen(Double dafen) {
        this.dafen = dafen == null ? 0.0f : dafen;
    }

    public String getBeizhu() {
        return beizhu;
    }
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? "" : beizhu.trim();
    }
    public Integer getDatiid() {
        return datiid;
    }
    public void setDatiid(Integer datiid) {
        this.datiid = datiid == null ? 0 : datiid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
