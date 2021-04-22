package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.ZiyuanMapper;
import com.spring.entity.Ziyuan;
import com.spring.service.ZiyuanService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("ZiyuanService")
public class ZiyuanServiceImpl extends ServiceBase<Ziyuan> implements ZiyuanService {
    @Resource
    private ZiyuanMapper dao;

    @Override
    protected ZiyuanMapper getDao() {
        return dao;
    }
}
