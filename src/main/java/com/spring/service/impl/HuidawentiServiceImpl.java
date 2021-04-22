package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.HuidawentiMapper;
import com.spring.entity.Huidawenti;
import com.spring.service.HuidawentiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("HuidawentiService")
public class HuidawentiServiceImpl extends ServiceBase<Huidawenti> implements HuidawentiService {
    @Resource
    private HuidawentiMapper dao;

    @Override
    protected HuidawentiMapper getDao() {
        return dao;
    }
}
