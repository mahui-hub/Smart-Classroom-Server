package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.SuitangceshiMapper;
import com.spring.entity.Suitangceshi;
import com.spring.service.SuitangceshiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("SuitangceshiService")
public class SuitangceshiServiceImpl extends ServiceBase<Suitangceshi> implements SuitangceshiService {
    @Resource
    private SuitangceshiMapper dao;

    @Override
    protected SuitangceshiMapper getDao() {
        return dao;
    }
}
