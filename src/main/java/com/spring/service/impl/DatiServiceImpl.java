package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.DatiMapper;
import com.spring.entity.Dati;
import com.spring.service.DatiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("DatiService")
public class DatiServiceImpl extends ServiceBase<Dati> implements DatiService {
    @Resource
    private DatiMapper dao;

    @Override
    protected DatiMapper getDao() {
        return dao;
    }
}
