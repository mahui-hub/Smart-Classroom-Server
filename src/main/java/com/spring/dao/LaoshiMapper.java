package com.spring.dao;

import com.base.MapperBase;
import com.spring.entity.Laoshi;

import org.springframework.stereotype.Repository;


@Repository
public interface LaoshiMapper extends MapperBase<Laoshi> {
    Laoshi login(Laoshi laoshi);
}
