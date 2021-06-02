package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.ZiyuanfenleiMapper;
import com.spring.entity.Ziyuanfenlei;
import com.spring.service.ZiyuanfenleiService;

import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("ZiyuanfenleiService")
public class ZiyuanfenleiServiceImpl extends ServiceBase<Ziyuanfenlei> implements ZiyuanfenleiService {
    @Resource
    private ZiyuanfenleiMapper dao;

    @Override
    protected ZiyuanfenleiMapper getDao() {
        return dao;
    }
}
