package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "pingbici")
public class Pingbici implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "guanjianzi")
    private String guanjianzi;
    @Column(name = "tihuanci")
    private String tihuanci;

    @Column(name = "addtime")
    private String addtime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getGuanjianzi() {
        return guanjianzi;
    }
    public void setGuanjianzi(String guanjianzi) {
        this.guanjianzi = guanjianzi == null ? "" : guanjianzi.trim();
    }

    public String getTihuanci() {
        return tihuanci;
    }
    public void setTihuanci(String tihuanci) {
        this.tihuanci = tihuanci == null ? "" : tihuanci.trim();
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
