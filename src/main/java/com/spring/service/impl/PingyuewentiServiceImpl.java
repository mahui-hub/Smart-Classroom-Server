package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.PingyuewentiMapper;
import com.spring.entity.Pingyuewenti;
import com.spring.service.PingyuewentiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("PingyuewentiService")
public class PingyuewentiServiceImpl extends ServiceBase<Pingyuewenti> implements PingyuewentiService {
    @Resource
    private PingyuewentiMapper dao;

    @Override
    protected PingyuewentiMapper getDao() {
        return dao;
    }
}
