package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.ChengjibiliMapper;
import com.spring.entity.Chengjibili;
import com.spring.service.ChengjibiliService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("ChengjibiliService")
public class ChengjibiliServiceImpl extends ServiceBase<Chengjibili> implements ChengjibiliService {
    @Resource
    private ChengjibiliMapper dao;

    @Override
    protected ChengjibiliMapper getDao() {
        return dao;
    }
}
