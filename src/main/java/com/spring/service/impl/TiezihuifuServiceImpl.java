package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.TiezihuifuMapper;
import com.spring.entity.Tiezihuifu;
import com.spring.service.TiezihuifuService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("TiezihuifuService")
public class TiezihuifuServiceImpl extends ServiceBase<Tiezihuifu> implements TiezihuifuService {
    @Resource
    private TiezihuifuMapper dao;

    @Override
    protected TiezihuifuMapper getDao() {
        return dao;
    }
}
