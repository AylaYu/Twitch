DROP TABLE IF EXISTS favorite_records;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;


CREATE TABLE users
(                                      -- //id只作为身份识别码用，不要求内容，只要求独特
    id INT PRIMARY KEY AUTO_INCREMENT,-- primary key:用来进行数据库查询，约等于各条目的id，使高效查询
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    password VARCHAR(100) NOT NULL,
    enabled  TINYINT      NOT NULL DEFAULT 1
);


CREATE TABLE items
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    twitch_id VARCHAR(255) UNIQUE NOT NULL,
    title TEXT,
    url VARCHAR(255),
    thumbnail_url VARCHAR(255),
    broadcaster_name VARCHAR(255),
    game_id VARCHAR(255),
    type VARCHAR(255)
);


CREATE TABLE favorite_records
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE, -- 表示两张表之间的关系
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE, -- ON DELETE CASCADE当 users 表里某一行（某个用户）被删除时，orders 表里所有 user_id 等于这个被删除用户ID的那些行（整行），都会被自动一起删除
    UNIQUE KEY unique_item_and_user_combo (item_id, user_id)
);


CREATE TABLE authorities
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username  VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL, -- ADMIN, USER, SUPER_ADMIN
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE ON UPDATE CASCADE
);
