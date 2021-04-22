package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "kaoshijieguo")
public class Kaoshijieguo implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "tikubianhao")
    private String tikubianhao;
    @Column(name = "tikumingcheng")
    private String tikumingcheng;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "kaoshibianhao")
    private String kaoshibianhao;
    @Column(name = "kaoshishichang")
    private String kaoshishichang;
    @Column(name = "danxuantidefen")
    private Integer danxuantidefen;
    @Column(name = "duoxuantidefen")
    private Integer duoxuantidefen;
    @Column(name = "tiankongtidefen")
    private Integer tiankongtidefen;
    @Column(name = "zongdefen")
    private Integer zongdefen;
    @Column(name = "kaoshiren")
    private String kaoshiren;
    private Integer tikuid;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getTikubianhao() {
        return tikubianhao;
    }
    public void setTikubianhao(String tikubianhao) {
        this.tikubianhao = tikubianhao == null ? "" : tikubianhao.trim();
    }

    public String getTikumingcheng() {
        return tikumingcheng;
    }
    public void setTikumingcheng(String tikumingcheng) {
        this.tikumingcheng = tikumingcheng == null ? "" : tikumingcheng.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getKaoshibianhao() {
        return kaoshibianhao;
    }
    public void setKaoshibianhao(String kaoshibianhao) {
        this.kaoshibianhao = kaoshibianhao == null ? "" : kaoshibianhao.trim();
    }

    public String getKaoshishichang() {
        return kaoshishichang;
    }
    public void setKaoshishichang(String kaoshishichang) {
        this.kaoshishichang = kaoshishichang == null ? "" : kaoshishichang.trim();
    }

    public Integer getDanxuantidefen() {
        return danxuantidefen;
    }
    public void setDanxuantidefen(Integer danxuantidefen) {
        this.danxuantidefen = danxuantidefen == null ? 0 : danxuantidefen;
    }

    public Integer getDuoxuantidefen() {
        return duoxuantidefen;
    }
    public void setDuoxuantidefen(Integer duoxuantidefen) {
        this.duoxuantidefen = duoxuantidefen == null ? 0 : duoxuantidefen;
    }

    public Integer getTiankongtidefen() {
        return tiankongtidefen;
    }
    public void setTiankongtidefen(Integer tiankongtidefen) {
        this.tiankongtidefen = tiankongtidefen == null ? 0 : tiankongtidefen;
    }

    public Integer getZongdefen() {
        return zongdefen;
    }
    public void setZongdefen(Integer zongdefen) {
        this.zongdefen = zongdefen == null ? 0 : zongdefen;
    }

    public String getKaoshiren() {
        return kaoshiren;
    }
    public void setKaoshiren(String kaoshiren) {
        this.kaoshiren = kaoshiren == null ? "" : kaoshiren.trim();
    }
    public Integer getTikuid() {
        return tikuid;
    }
    public void setTikuid(Integer tikuid) {
        this.tikuid = tikuid == null ? 0 : tikuid;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
