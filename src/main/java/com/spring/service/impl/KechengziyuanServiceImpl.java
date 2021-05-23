package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.KechengziyuanMapper;
import com.spring.entity.Kechengziyuan;
import com.spring.service.KechengziyuanService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service("KechengziyuanService")
public class KechengziyuanServiceImpl extends ServiceBase<Kechengziyuan> implements KechengziyuanService {
    @Resource
    private KechengziyuanMapper dao;

    @Override
    protected KechengziyuanMapper getDao() {
        return dao;
    }
}
