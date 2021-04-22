package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.QiuzhujiaoshiMapper;
import com.spring.entity.Qiuzhujiaoshi;
import com.spring.service.QiuzhujiaoshiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("QiuzhujiaoshiService")
public class QiuzhujiaoshiServiceImpl extends ServiceBase<Qiuzhujiaoshi> implements QiuzhujiaoshiService {
    @Resource
    private QiuzhujiaoshiMapper dao;

    @Override
    protected QiuzhujiaoshiMapper getDao() {
        return dao;
    }
}
