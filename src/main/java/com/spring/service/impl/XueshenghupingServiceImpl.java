package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.XueshenghupingMapper;
import com.spring.entity.Xueshenghuping;
import com.spring.service.XueshenghupingService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("XueshenghupingService")
public class XueshenghupingServiceImpl extends ServiceBase<Xueshenghuping> implements XueshenghupingService {
    @Resource
    private XueshenghupingMapper dao;

    @Override
    protected XueshenghupingMapper getDao() {
        return dao;
    }
}
