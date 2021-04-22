package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.TikuMapper;
import com.spring.entity.Tiku;
import com.spring.service.TikuService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("TikuService")
public class TikuServiceImpl extends ServiceBase<Tiku> implements TikuService {
    @Resource
    private TikuMapper dao;

    @Override
    protected TikuMapper getDao() {
        return dao;
    }
}
