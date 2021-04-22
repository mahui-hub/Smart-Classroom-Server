package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "tiku")
public class Tiku implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "tikubianhao")
    private String tikubianhao;
    @Column(name = "tikumingcheng")
    private String tikumingcheng;
    @Column(name = "jiaoshi")
    private String jiaoshi;
    @Column(name = "faburen")
    private String faburen;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getShitiCount()
    {
        return Query.make("shiti").where("tikuid" , id).count();
    }
    public Long getJieguoCount()
    {
        return Query.make("jieguo").where("tikuid" , id).count();
    }
    public Long getKaoshijieguoCount()
    {
        return Query.make("kaoshijieguo").where("tikuid" , id).count();
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

    public String getJiaoshi() {
        return jiaoshi;
    }
    public void setJiaoshi(String jiaoshi) {
        this.jiaoshi = jiaoshi == null ? "" : jiaoshi.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
