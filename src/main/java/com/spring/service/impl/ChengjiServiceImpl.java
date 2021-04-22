package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.ChengjiMapper;
import com.spring.entity.Chengji;
import com.spring.service.ChengjiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("ChengjiService")
public class ChengjiServiceImpl extends ServiceBase<Chengji> implements ChengjiService {
    @Resource
    private ChengjiMapper dao;

    @Override
    protected ChengjiMapper getDao() {
        return dao;
    }
}
