package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.TiezifenleiMapper;
import com.spring.entity.Tiezifenlei;
import com.spring.service.TiezifenleiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("TiezifenleiService")
public class TiezifenleiServiceImpl extends ServiceBase<Tiezifenlei> implements TiezifenleiService {
    @Resource
    private TiezifenleiMapper dao;

    @Override
    protected TiezifenleiMapper getDao() {
        return dao;
    }
}
