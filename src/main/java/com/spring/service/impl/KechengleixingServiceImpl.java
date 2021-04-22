package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.KechengleixingMapper;
import com.spring.entity.Kechengleixing;
import com.spring.service.KechengleixingService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("KechengleixingService")
public class KechengleixingServiceImpl extends ServiceBase<Kechengleixing> implements KechengleixingService {
    @Resource
    private KechengleixingMapper dao;

    @Override
    protected KechengleixingMapper getDao() {
        return dao;
    }
}
