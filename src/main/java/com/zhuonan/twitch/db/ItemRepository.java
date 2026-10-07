package com.zhuonan.twitch.db;


// imports...


import com.zhuonan.twitch.db.entity.ItemEntity;
import org.springframework.data.repository.ListCrudRepository;


public interface ItemRepository extends ListCrudRepository<ItemEntity, Long> {


    ItemEntity findByTwitchId(String twitchId);
}

