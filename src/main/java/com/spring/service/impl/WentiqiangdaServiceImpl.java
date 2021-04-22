package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.WentiqiangdaMapper;
import com.spring.entity.Wentiqiangda;
import com.spring.service.WentiqiangdaService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("WentiqiangdaService")
public class WentiqiangdaServiceImpl extends ServiceBase<Wentiqiangda> implements WentiqiangdaService {
    @Resource
    private WentiqiangdaMapper dao;

    @Override
    protected WentiqiangdaMapper getDao() {
        return dao;
    }
}
