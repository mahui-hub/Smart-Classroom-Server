package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.QiandaoMapper;
import com.spring.entity.Qiandao;
import com.spring.service.QiandaoService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("QiandaoService")
public class QiandaoServiceImpl extends ServiceBase<Qiandao> implements QiandaoService {
    @Resource
    private QiandaoMapper dao;

    @Override
    protected QiandaoMapper getDao() {
        return dao;
    }
}
