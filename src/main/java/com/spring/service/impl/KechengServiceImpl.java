package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.KechengMapper;
import com.spring.entity.Kecheng;
import com.spring.service.KechengService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("KechengService")
public class KechengServiceImpl extends ServiceBase<Kecheng> implements KechengService {
    @Resource
    private KechengMapper dao;

    @Override
    protected KechengMapper getDao() {
        return dao;
    }
}
