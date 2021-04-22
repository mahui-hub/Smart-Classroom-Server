package com.spring.service;

import com.base.IServiceBase;
import com.spring.entity.Laoshi;

public interface LaoshiService extends IServiceBase<Laoshi> {
    public Laoshi login(String username, String password);
    public boolean updatePassword(int id, String newPassword);
}
