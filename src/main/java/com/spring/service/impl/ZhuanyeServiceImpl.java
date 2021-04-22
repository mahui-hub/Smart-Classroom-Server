package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.ZhuanyeMapper;
import com.spring.entity.Zhuanye;
import com.spring.service.ZhuanyeService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("ZhuanyeService")
public class ZhuanyeServiceImpl extends ServiceBase<Zhuanye> implements ZhuanyeService {
    @Resource
    private ZhuanyeMapper dao;

    @Override
    protected ZhuanyeMapper getDao() {
        return dao;
    }
}
