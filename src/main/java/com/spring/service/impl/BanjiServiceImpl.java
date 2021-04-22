package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.BanjiMapper;
import com.spring.entity.Banji;
import com.spring.service.BanjiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("BanjiService")
public class BanjiServiceImpl extends ServiceBase<Banji> implements BanjiService {
    @Resource
    private BanjiMapper dao;

    @Override
    protected BanjiMapper getDao() {
        return dao;
    }
}
