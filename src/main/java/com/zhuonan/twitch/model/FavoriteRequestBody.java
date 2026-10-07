package com.zhuonan.twitch.model;


// imports...


import com.zhuonan.twitch.db.entity.ItemEntity;


public record FavoriteRequestBody(
        ItemEntity favorite
) {}
