package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.QiangdawentiMapper;
import com.spring.entity.Qiangdawenti;
import com.spring.service.QiangdawentiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("QiangdawentiService")
public class QiangdawentiServiceImpl extends ServiceBase<Qiangdawenti> implements QiangdawentiService {
    @Resource
    private QiangdawentiMapper dao;

    @Override
    protected QiangdawentiMapper getDao() {
        return dao;
    }
}
