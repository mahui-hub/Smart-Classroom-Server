package com.spring.service;

import com.base.IServiceBase;
import com.spring.entity.Jiaoshi;

public interface JiaoshiService extends IServiceBase<Jiaoshi> {
    public Jiaoshi login(String username, String password);
    public boolean updatePassword(int id, String newPassword);
}
