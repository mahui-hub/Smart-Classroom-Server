package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "pingyuewenti")
public class Pingyuewenti implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "bianhao")
    private String bianhao;
    @Column(name = "biaoti")
    private String biaoti;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "qiangdaren")
    private String qiangdaren;
    @Column(name = "pingfen")
    private Double pingfen;
    @Column(name = "pingyuejianjie")
    private String pingyuejianjie;
    @Column(name = "pingyueren")
    private String pingyueren;
    private Integer huidawentiid;

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

    public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getQiangdaren() {
        return qiangdaren;
    }
    public void setQiangdaren(String qiangdaren) {
        this.qiangdaren = qiangdaren == null ? "" : qiangdaren.trim();
    }

    public Double getPingfen() {
        return pingfen;
    }
    public void setPingfen(Double pingfen) {
        this.pingfen = pingfen == null ? 0.0f : pingfen;
    }

    public String getPingyuejianjie() {
        return pingyuejianjie;
    }
    public void setPingyuejianjie(String pingyuejianjie) {
        this.pingyuejianjie = pingyuejianjie == null ? "" : pingyuejianjie.trim();
    }

    public String getPingyueren() {
        return pingyueren;
    }
    public void setPingyueren(String pingyueren) {
        this.pingyueren = pingyueren == null ? "" : pingyueren.trim();
    }
    public Integer getHuidawentiid() {
        return huidawentiid;
    }
    public void setHuidawentiid(Integer huidawentiid) {
        this.huidawentiid = huidawentiid == null ? 0 : huidawentiid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
