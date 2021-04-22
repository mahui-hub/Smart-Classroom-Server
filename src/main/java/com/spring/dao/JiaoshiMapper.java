package com.spring.dao;

import com.base.MapperBase;
import com.spring.entity.Jiaoshi;

import org.springframework.stereotype.Repository;


@Repository
public interface JiaoshiMapper extends MapperBase<Jiaoshi> {
    Jiaoshi login(Jiaoshi jiaoshi);
}
