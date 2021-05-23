package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.ZhichengMapper;
import com.spring.entity.Zhicheng;
import com.spring.service.ZhichengService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;
@Service("ZhichengService")
public class ZhichengServiceImpl extends ServiceBase<Zhicheng> implements ZhichengService {
    @Resource
    private ZhichengMapper dao;

    @Override
    protected ZhichengMapper getDao() {
        return dao;
    }
}
