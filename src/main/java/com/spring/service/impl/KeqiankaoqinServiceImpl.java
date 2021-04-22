package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.KeqiankaoqinMapper;
import com.spring.entity.Keqiankaoqin;
import com.spring.service.KeqiankaoqinService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("KeqiankaoqinService")
public class KeqiankaoqinServiceImpl extends ServiceBase<Keqiankaoqin> implements KeqiankaoqinService {
    @Resource
    private KeqiankaoqinMapper dao;

    @Override
    protected KeqiankaoqinMapper getDao() {
        return dao;
    }
}
