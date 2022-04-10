-- Up

CREATE TABLE users (
    id integer primary key,
    username text not null,
    password text not null
);

CREATE TABLE followers (
    follower_id integer not null,
    followee_id integer not null
);

CREATE TABLE podcasts (
    id integer primary key,
    name text not null,
    genre text not null,
    avg_monthly_listeners integer not null,
    publisher_id integer not null
);

CREATE TABLE episodes (
    id integer primary key,
    title text not null,
    podcast_id integer not null
);

CREATE TABLE collections (
    id integer primary key,
    name text not null,
    creator_id integer not null
);

CREATE TABLE collection_episodes (
    episode_id integer not null,
    collection_id integer not null
);

CREATE TABLE libraries (
    user_id integer not null,
    collection_id integer not null
);

-- Down

DROP TABLE users;
DROP TABLE followers;
DROP TABLE podcasts;
DROP TABLE episodes;
DROP TABLE collections;
DROP TABLE collection_episodes;
DROP TABLE libraries;