package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.WentisousuoMapper;
import com.spring.entity.Wentisousuo;
import com.spring.service.WentisousuoService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("WentisousuoService")
public class WentisousuoServiceImpl extends ServiceBase<Wentisousuo> implements WentisousuoService {
    @Resource
    private WentisousuoMapper dao;

    @Override
    protected WentisousuoMapper getDao() {
        return dao;
    }
}
