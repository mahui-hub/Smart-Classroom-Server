package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.DatipingyueMapper;
import com.spring.entity.Datipingyue;
import com.spring.service.DatipingyueService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("DatipingyueService")
public class DatipingyueServiceImpl extends ServiceBase<Datipingyue> implements DatipingyueService {
    @Resource
    private DatipingyueMapper dao;

    @Override
    protected DatipingyueMapper getDao() {
        return dao;
    }
}
