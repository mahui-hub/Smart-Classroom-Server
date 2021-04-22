package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.LaoshiMapper;
import com.spring.entity.Laoshi;
import com.spring.service.LaoshiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("LaoshiService")
public class LaoshiServiceImpl extends ServiceBase<Laoshi> implements LaoshiService {
    @Resource
    private LaoshiMapper dao;

    @Override
    protected LaoshiMapper getDao() {
        return dao;
    }
    public Laoshi login(String username, String password) {
        Laoshi user = new Laoshi();
        user.setGonghao(username);
            user.setMima(password);

        return this.dao.login(user);
    }

    public boolean updatePassword(int id, String newPassword) {
        Laoshi user = new Laoshi();
        user.setId(id);
            user.setMima(newPassword);
        int i = this.dao.updateByPrimaryKeySelective(user);
        return i == 1;
    }
}
