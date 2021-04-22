package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.PingbiciMapper;
import com.spring.entity.Pingbici;
import com.spring.service.PingbiciService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("PingbiciService")
public class PingbiciServiceImpl extends ServiceBase<Pingbici> implements PingbiciService {
    @Resource
    private PingbiciMapper dao;

    @Override
    protected PingbiciMapper getDao() {
        return dao;
    }
}
