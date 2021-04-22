package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.KaoshijieguoMapper;
import com.spring.entity.Kaoshijieguo;
import com.spring.service.KaoshijieguoService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("KaoshijieguoService")
public class KaoshijieguoServiceImpl extends ServiceBase<Kaoshijieguo> implements KaoshijieguoService {
    @Resource
    private KaoshijieguoMapper dao;

    @Override
    protected KaoshijieguoMapper getDao() {
        return dao;
    }
}
