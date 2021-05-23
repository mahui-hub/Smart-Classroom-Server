package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.XueyuanMapper;
import com.spring.entity.Xueyuan;
import com.spring.service.XueyuanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service("XueyuanService")
public class XueyuanServiceImpl extends ServiceBase<Xueyuan> implements XueyuanService {
    @Resource
    private XueyuanMapper dao;

    @Override
    protected XueyuanMapper getDao() {
        return dao;
    }
}
