package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.DianzanMapper;
import com.spring.entity.Dianzan;
import com.spring.service.DianzanService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("DianzanService")
public class DianzanServiceImpl extends ServiceBase<Dianzan> implements DianzanService {
    @Resource
    private DianzanMapper dao;

    @Override
    protected DianzanMapper getDao() {
        return dao;
    }
}
