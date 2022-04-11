--delete previous instances of tables if they exist - idempotent for multiple script runs
drop table if exists users;
drop table if exists podcasts;
drop table if exists episodes;
drop table if exists collections;
drop table if exists collection_episodes;
drop table if exists libraries;

--set schemas
create table users (
    id integer primary key,
    username text not null,
    password text not null
);

create table podcasts (
    id integer primary key,
    name text not null,
    genre text not null,
    publication_date text not null,
    publisher_id integer not null
);

create table episodes (
    id integer primary key,
    title text not null,
    runtime integer not null,
    podcast_id integer not null
);

create table collections (
    id integer primary key,
    name text not null,
    creator_id integer not null
);

create table collection_episodes (
    episode_id integer not null,
    collection_id integer not null
);

create table libraries (
    user_id integer not null,
    collection_id integer not null
);

--populate users table
insert into users (username, password) values ('admin', 'admin');
insert into users (username, password) values ('Mark', 'm123');
insert into users (username, password) values ('John', 'j456');
insert into users (username, password) values ('Jane', 'ja789');
insert into users (username, password) values ('Bob', 'b123');
insert into users (username, password) values ('Mary', 'm456');
insert into users (username, password) values ('Sue', 's789');
insert into users (username, password) values ('Tom', 't123');
insert into users (username, password) values ('Jack', 'j456*');
insert into users (username, password) values ('Jill', 'j7-89');
insert into users (username, password) values ('Bill', 'llib*&');
insert into users (username, password) values ('Jacob', '4011**');
insert into users (username, password) values ('Adam', 'Arch*&');


--populate podcasts table
insert into podcasts(name, genre, publication_date, publisher_id) values ('The Adam Archer Experience', 'Lifestyle', 'January 3, 2020', 2);
insert into podcasts(name, genre, publication_date, publisher_id) values ('The Roe Jogan Experience', 'Comedy', 'September 28, 2014', 3);
insert into podcasts(name, genre, publication_date, publisher_id) values ('Armchair Engineer', 'Science', 'August 4, 2019', 4);
insert into podcasts(name, genre, publication_date, publisher_id) values ('Morning Cofee', 'Lifestyle', 'April 19, 2015', 5);
insert into podcasts(name, genre, publication_date, publisher_id) values ('Buzzer Beater', 'Sports', 'February 12, 2016', 6);
insert into podcasts(name, genre, publication_date, publisher_id) values ('The Flick Pick', 'Cinema', 'May 14, 2019', 7);
insert into podcasts(name, genre, publication_date, publisher_id) values ('Heart and Soul', 'Music', 'June 16 2011', 8);
insert into podcasts(name, genre, publication_date, publisher_id) values ('Addicted to the shindig', 'Music', 'October 25, 2016', 9);
insert into podcasts(name, genre, publication_date, publisher_id) values ('The Daily Show', 'Comedy', 'July 8, 2013', 10);
insert into podcasts(name, genre, publication_date, publisher_id) values ('The Blue Box', 'Politics', 'November 22, 2018', 11);
insert into podcasts(name, genre, publication_date, publisher_id) values ('Our Blue Planet', 'Science', 'December 10, 2021', 12);

--populate episodes table
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 1', 64, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 2', 59, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 3', 52, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 4', 60, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 5', 63, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 6', 59, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 7', 52, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 8', 54, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 9', 61, 1);
insert into episodes (title, runtime, podcast_id) values ('The Adam Archer Experience - Episode 10', 62, 1);
insert into episodes (title, runtime, podcast_id) values ('ep1 - Chris Rock', 53, 2);
insert into episodes (title, runtime, podcast_id) values ('ep2 - Ari Shafir', 57, 2);
insert into episodes (title, runtime, podcast_id) values ('ep3 -  Dave Chapelle', 51, 2);
insert into episodes (title, runtime, podcast_id) values ('ep4 - Colin Jost', 59, 2);
insert into episodes (title, runtime, podcast_id) values ('ep5 - Jim Jefferies', 58, 2);
insert into episodes (title, runtime, podcast_id) values ('ep6 - Russell Peters', 54, 2);
insert into episodes (title, runtime, podcast_id) values ('ep7 - Bert Kreischer', 51, 2);
insert into episodes (title, runtime, podcast_id) values ('ep8 - Tom Segura', 59, 2);
insert into episodes (title, runtime, podcast_id) values ('Armchair Engineer - Elon Musk', 62, 3);
insert into episodes (title, runtime, podcast_id) values ('Armchair Engineer - Bill Gates', 64, 3);
insert into episodes (title, runtime, podcast_id) values ('Armchair Engineer - Mark Zuckerberg', 67, 3);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep1', 67, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep2', 62, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep3', 63, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep4', 61, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep5', 64, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep6', 66, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep7', 67, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep8', 65, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep9', 61, 4);
insert into episodes (title, runtime, podcast_id) values ('Morning Cofee - ep10', 62, 4);
insert into episodes (title, runtime, podcast_id) values ('Episode 1 ft. Steve Kerr', 67, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 2  ft. Chris Bosh', 68, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 3 ft. Scottie Pippin', 69, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 4 ft. Shaq', 61, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 5 ft. Kareem Abdul-Jabbar', 62, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 6 ft. Magic Johnson', 63, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 7 ft. Larry Bird', 64, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 8 ft. Kevin Garnett', 67, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 9 ft. Charles Barkley', 68, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 10 ft. Isiah Thomas', 61, 5);
insert into episodes (title, runtime, podcast_id) values ('Episode 11 ft. Michael Jordan', 64, 5);
insert into episodes (title, runtime, podcast_id) values ('Retro Rewind: Back to the future', 69, 6);
insert into episodes (title, runtime, podcast_id) values ('Retro Rewind: The Matrix', 56, 6);
insert into episodes (title, runtime, podcast_id) values ('Interview: James Cameron', 51, 6);
insert into episodes (title, runtime, podcast_id) values ('Interview: Steven Spielberg', 54, 6);
insert into episodes (title, runtime, podcast_id) values ('Retro Rewind: Indiana Jones', 52, 6);
insert into episodes (title, runtime, podcast_id) values ('Retro Rewind: Star Wars', 51, 6);
insert into episodes (title, runtime, podcast_id) values ('Interview: George Lucas', 58, 6);
insert into episodes (title, runtime, podcast_id) values ('Jamming with Chris Stapleton', 62, 7);
insert into episodes (title, runtime, podcast_id) values ('Jamming with Luke Combs', 61, 7);
insert into episodes (title, runtime, podcast_id) values ('Jamming with Kenny Rogers', 59, 7);
insert into episodes (title, runtime, podcast_id) values ('Jamming with Eric Church', 57, 7);
insert into episodes (title, runtime, podcast_id) values ('Episode 1 - Foo fighters', 68, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 2 - Blink183', 67, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 3 - Rage Against the Machine', 61, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 4 - The Cure', 63, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 5 - The Ramones', 66, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 6 - Sound Garden', 61, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 7 - Pearl Jam', 64, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 8 - Red Hot Chilli Peppers', 72, 8);
insert into episodes (title, runtime, podcast_id) values ('Episode 9 - Janes Addiction', 68, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 1', 61, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 2', 64, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 3', 67, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 4', 63, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 5', 65, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 6', 68, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 7', 70, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 8', 61, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 9', 63, 8);
insert into episodes (title, runtime, podcast_id) values ('The Daily Show - Episode 10', 64, 8);
insert into episodes (title, runtime, podcast_id) values ('The Blue Box (ft. Bill Maher)', 72, 9);
insert into episodes (title, runtime, podcast_id) values ('The Blue Box (ft. John Oliver)', 75, 9);
insert into episodes (title, runtime, podcast_id) values ('The Blue Box (ft. Jake Tapper)', 78, 9);
insert into episodes (title, runtime, podcast_id) values ('The Blue Box (ft. Anderson Cooper)', 671, 9);
insert into episodes (title, runtime, podcast_id) values ('OBP ep1, climate catastrophes ft. Bill Gates', 59, 10);
insert into episodes (title, runtime, podcast_id) values ('OBP ep2, Australian Sperm Wales', 84, 10);
insert into episodes (title, runtime, podcast_id) values ('OBP ep2, Antarctica', 87, 10);

--populate collections table
insert into collections (name, creator_id) values ('Best of AAE', 1);
insert into collections (name, creator_id) values ('music favs', 1);
insert into collections (name, creator_id) values ('podcast favs', 1);
insert into collections (name, creator_id) values ('political', 1);
insert into collections (name, creator_id) values ('best educational pods', 2);
insert into collections (name, creator_id) values ('best science pods', 2);
insert into collections (name, creator_id) values ('roadtrip pods', 6);
insert into collections (name, creator_id) values ('interview pods', 6);
insert into collections (name, creator_id) values ('movie pods', 6);
insert into collections (name, creator_id) values ('Buzzer Beater - 90s Bulls Interviews', 6);
insert into collections (name, creator_id) values ('Satire Gold', 7);

--populate collection_episodes table
insert into collection_episodes (collection_id, episode_id) values (1, 1);
insert into collection_episodes (collection_id, episode_id) values (1, 2);
insert into collection_episodes (collection_id, episode_id) values (1, 5);
insert into collection_episodes (collection_id, episode_id) values (1, 7);
insert into collection_episodes (collection_id, episode_id) values (1, 8);
insert into collection_episodes (collection_id, episode_id) values (2, 54);
insert into collection_episodes (collection_id, episode_id) values (2, 57);
insert into collection_episodes (collection_id, episode_id) values (2, 61);
insert into collection_episodes (collection_id, episode_id) values (2, 62);
insert into collection_episodes (collection_id, episode_id) values (3, 1);
insert into collection_episodes (collection_id, episode_id) values (3, 4);
insert into collection_episodes (collection_id, episode_id) values (3, 5);
insert into collection_episodes (collection_id, episode_id) values (3, 9);
insert into collection_episodes (collection_id, episode_id) values (3, 12);
insert into collection_episodes (collection_id, episode_id) values (3, 13);
insert into collection_episodes (collection_id, episode_id) values (3, 22);
insert into collection_episodes (collection_id, episode_id) values (3, 31);
insert into collection_episodes (collection_id, episode_id) values (3, 33);
insert into collection_episodes (collection_id, episode_id) values (3, 37);
insert into collection_episodes (collection_id, episode_id) values (3, 43);
insert into collection_episodes (collection_id, episode_id) values (3, 51);
insert into collection_episodes (collection_id, episode_id) values (3, 52);
insert into collection_episodes(collection_id, episode_id) values (4, 73);
insert into collection_episodes(collection_id, episode_id) values (4, 75);
insert into collection_episodes(collection_id, episode_id) values (4, 76);
insert into collection_episodes(collection_id, episode_id) values (5, 19);
insert into collection_episodes(collection_id, episode_id) values (5, 20);
insert into collection_episodes(collection_id, episode_id) values (5, 21);
insert into collection_episodes(collection_id, episode_id) values (5, 77);
insert into collection_episodes(collection_id, episode_id) values (5, 78);
insert into collection_episodes(collection_id, episode_id) values (5, 79);
insert into collection_episodes(collection_id, episode_id) values (6, 19);
insert into collection_episodes(collection_id, episode_id) values (6, 20);
insert into collection_episodes(collection_id, episode_id) values (6, 77);
insert into collection_episodes(collection_id, episode_id) values (6, 78);
insert into collection_episodes(collection_id, episode_id) values (6, 79);
insert into collection_episodes(collection_id, episode_id) values (7, 1);
insert into collection_episodes(collection_id, episode_id) values (7, 2);
insert into collection_episodes(collection_id, episode_id) values (7, 11);
insert into collection_episodes(collection_id, episode_id) values (7, 22);
insert into collection_episodes(collection_id, episode_id) values (7, 63);
insert into collection_episodes(collection_id, episode_id) values (7, 64);
insert into collection_episodes(collection_id, episode_id) values (7, 66);
insert into collection_episodes(collection_id, episode_id) values (8, 1);
insert into collection_episodes(collection_id, episode_id) values (8, 2);
insert into collection_episodes(collection_id, episode_id) values (8, 3);
insert into collection_episodes(collection_id, episode_id) values (8, 4);
insert into collection_episodes(collection_id, episode_id) values (8, 5);
insert into collection_episodes(collection_id, episode_id) values (8, 6);
insert into collection_episodes(collection_id, episode_id) values (8, 7);
insert into collection_episodes(collection_id, episode_id) values (8, 8);
insert into collection_episodes(collection_id, episode_id) values (8, 9);
insert into collection_episodes(collection_id, episode_id) values (8, 10);
insert into collection_episodes(collection_id, episode_id) values (8, 11);
insert into collection_episodes(collection_id, episode_id) values (8, 12);
insert into collection_episodes(collection_id, episode_id) values (8, 13);
insert into collection_episodes(collection_id, episode_id) values (8, 14);
insert into collection_episodes(collection_id, episode_id) values (8, 15);
insert into collection_episodes(collection_id, episode_id) values (8, 16);
insert into collection_episodes(collection_id, episode_id) values (8, 17);
insert into collection_episodes(collection_id, episode_id) values (8, 18);
insert into collection_episodes(collection_id, episode_id) values (8, 19);
insert into collection_episodes(collection_id, episode_id) values (8, 20);
insert into collection_episodes(collection_id, episode_id) values (8, 21);
insert into collection_episodes(collection_id, episode_id) values (8, 32);
insert into collection_episodes(collection_id, episode_id) values (8, 33);
insert into collection_episodes(collection_id, episode_id) values (8, 34);
insert into collection_episodes(collection_id, episode_id) values (8, 35);
insert into collection_episodes(collection_id, episode_id) values (8, 36);
insert into collection_episodes(collection_id, episode_id) values (8, 37);
insert into collection_episodes(collection_id, episode_id) values (8, 38);
insert into collection_episodes(collection_id, episode_id) values (8, 39);
insert into collection_episodes(collection_id, episode_id) values (8, 40);
insert into collection_episodes(collection_id, episode_id) values (8, 41);
insert into collection_episodes(collection_id, episode_id) values (8, 42);
insert into collection_episodes(collection_id, episode_id) values (8, 45);
insert into collection_episodes(collection_id, episode_id) values (8, 46);
insert into collection_episodes(collection_id, episode_id) values (8, 52);
insert into collection_episodes(collection_id, episode_id) values (8, 53);
insert into collection_episodes(collection_id, episode_id) values (9, 43);
insert into collection_episodes(collection_id, episode_id) values (9, 44);
insert into collection_episodes(collection_id, episode_id) values (9, 45);
insert into collection_episodes(collection_id, episode_id) values (9, 46);
insert into collection_episodes(collection_id, episode_id) values (9, 47);
insert into collection_episodes(collection_id, episode_id) values (9, 48);
insert into collection_episodes(collection_id, episode_id) values (9, 49);
insert into collection_episodes(collection_id, episode_id) values (10, 32);
insert into collection_episodes(collection_id, episode_id) values (10, 34);
insert into collection_episodes(collection_id, episode_id) values (10, 42);
insert into collection_episodes(collection_id, episode_id) values (10, 43);
insert into collection_episodes(collection_id, episode_id) values (11, 64);
insert into collection_episodes(collection_id, episode_id) values (11, 65);
insert into collection_episodes(collection_id, episode_id) values (11, 68);
insert into collection_episodes(collection_id, episode_id) values (11, 74);
insert into collection_episodes(collection_id, episode_id) values (11, 75);
insert into collection_episodes(collection_id, episode_id) values (11, 76);

--populate libraries table
insert into libraries(user_id, collection_id) values (1, 1);
insert into libraries(user_id, collection_id) values (1, 2);
insert into libraries(user_id, collection_id) values (1, 3);
insert into libraries(user_id, collection_id) values (1, 4);
insert into libraries(user_id, collection_id) values (1, 5);
insert into libraries(user_id, collection_id) values (1, 8);
insert into libraries(user_id, collection_id) values (2, 2);
insert into libraries(user_id, collection_id) values (2, 5);
insert into libraries(user_id, collection_id) values (2, 6);
insert into libraries(user_id, collection_id) values (2, 7);
insert into libraries(user_id, collection_id) values (3, 1);
insert into libraries(user_id, collection_id) values (3, 2);
insert into libraries(user_id, collection_id) values (3, 3);
insert into libraries(user_id, collection_id) values (3, 7);
insert into libraries(user_id, collection_id) values (3, 8);
insert into libraries(user_id, collection_id) values (3, 9);
insert into libraries(user_id, collection_id) values (4, 1);
insert into libraries(user_id, collection_id) values (4, 9);
insert into libraries(user_id, collection_id) values (5, 2);
insert into libraries(user_id, collection_id) values (5, 3);
insert into libraries(user_id, collection_id) values (5, 4);
insert into libraries(user_id, collection_id) values (5, 6);
insert into libraries(user_id, collection_id) values (5, 7);
insert into libraries(user_id, collection_id) values (5, 9);
insert into libraries(user_id, collection_id) values (6, 4);
insert into libraries(user_id, collection_id) values (6, 5);
insert into libraries(user_id, collection_id) values (6, 6);
insert into libraries(user_id, collection_id) values (6, 7);
insert into libraries(user_id, collection_id) values (6, 8);
insert into libraries(user_id, collection_id) values (6, 9);
insert into libraries(user_id, collection_id) values (7, 10);
insert into libraries(user_id, collection_id) values (8, 4);
insert into libraries(user_id, collection_id) values (8, 5);
insert into libraries(user_id, collection_id) values (8, 9);
insert into libraries(user_id, collection_id) values (8, 10);
insert into libraries(user_id, collection_id) values (9, 3);
insert into libraries(user_id, collection_id) values (9, 4);
insert into libraries(user_id, collection_id) values (9, 5);
insert into libraries(user_id, collection_id) values (9, 6);
insert into libraries(user_id, collection_id) values (10, 2);
insert into libraries(user_id, collection_id) values (10, 3);
insert into libraries(user_id, collection_id) values (11, 4);
insert into libraries(user_id, collection_id) values (11, 5);
insert into libraries(user_id, collection_id) values (11, 6);
insert into libraries(user_id, collection_id) values (11, 7);
insert into libraries(user_id, collection_id) values (11, 8);
insert into libraries(user_id, collection_id) values (11, 9);
insert into libraries(user_id, collection_id) values (11, 10);
insert into libraries(user_id, collection_id) values (12, 2);
insert into libraries(user_id, collection_id) values (12, 3);
insert into libraries(user_id, collection_id) values (12, 4);
insert into libraries(user_id, collection_id) values (12, 5);
insert into libraries(user_id, collection_id) values (12, 6);
insert into libraries(user_id, collection_id) values (12, 8);

