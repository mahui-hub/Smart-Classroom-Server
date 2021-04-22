package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.JiaoshiMapper;
import com.spring.entity.Jiaoshi;
import com.spring.service.JiaoshiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("JiaoshiService")
public class JiaoshiServiceImpl extends ServiceBase<Jiaoshi> implements JiaoshiService {
    @Resource
    private JiaoshiMapper dao;

    @Override
    protected JiaoshiMapper getDao() {
        return dao;
    }
    public Jiaoshi login(String username, String password) {
        Jiaoshi user = new Jiaoshi();
        user.setGonghao(username);
            user.setMima(password);

        return this.dao.login(user);
    }

    public boolean updatePassword(int id, String newPassword) {
        Jiaoshi user = new Jiaoshi();
        user.setId(id);
            user.setMima(newPassword);
        int i = this.dao.updateByPrimaryKeySelective(user);
        return i == 1;
    }
}
