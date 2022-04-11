import express from 'express';
import { engine } from 'express-handlebars';
import sqlite3 from 'sqlite3'
import { open } from 'sqlite'
import session from 'express-session';


const app = express();
const port = 3000;

app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.set('views', './views');

app.use(express.urlencoded({extended: true}));
app.use(express.static('public'))

//register session middleware
app.use(session({
    secret: 'a secret',
    cookie: { maxAge: 60000},
    resave: true,
    saveUninitialized: false
}));

const dbPromise = open({
    filename: 'data.db',
    driver: sqlite3.Database
});

app.get('/', async(req, res) => {
    const db = await dbPromise;
    const podcasts = await db.all('SELECT podcasts.id, name, genre, publication_date, username FROM podcasts JOIN users ON podcasts.publisher_id = users.id');
    console.log(`SELECT podcasts.id, name, genre, publication_date, username FROM podcasts JOIN users ON podcasts.publisher_id = users.id`);
    const addPod = true;
    res.render('home', { podcasts, addPod });
});

app.get('/users', async(req, res) => {
    const db = await dbPromise;
    const users = await db.all('SELECT * FROM users WHERE users.id != 1');
    console.log(`SELECT * FROM users WHERE users.id != 1`);
    const addPod = true;
    res.render('users', { users, addPod });
});

app.post('/podcast-episodes', async(req, res) => {
    const db = await dbPromise;
    const { podcast_id } = req.body;
    const podcast_name = await db.get('SELECT name FROM podcasts WHERE id = ?', podcast_id);
    console.log(`SELECT name FROM podcasts WHERE id = ${podcast_id}`);
    const name = podcast_name.name;
    const episodes = await db.all(`SELECT * FROM episodes WHERE podcast_id = ${podcast_id}`);
    console.log(`SELECT * FROM episodes WHERE podcast_id = ${podcast_id}`);
    addDisplayRuntime(episodes);
    res.render('episodes', { name, episodes });
});

app.get('/collections', async(req, res) => {
    const db = await dbPromise;
    const collections = await db.all(`SELECT collections.id, name, username FROM collections JOIN users ON collections.creator_id = users.id`);
    console.log(`SELECT collections.id, name, username FROM collections JOIN users ON collections.creator_id = users.id`);
    res.render('collections', { collections });
});

app.post('/collection-episodes', async(req, res) => {
    const db = await dbPromise;
    const { collection_id } = req.body;
    const collection_name = await db.get('SELECT name FROM collections WHERE id = ?', collection_id);
    console.log(`SELECT name FROM collections WHERE id = ${collection_id}`);
    const name = collection_name.name;
    const episodes = await db.all(`SELECT * FROM episodes JOIN (SELECT episode_id FROM collection_episodes WHERE collection_id = ${collection_id}) ON episodes.id = episode_id`);
    addDisplayRuntime(episodes);
    console.log(`SELECT * FROM episodes JOIN (SELECT episode_id FROM collection_episodes WHERE collection_id = ${collection_id}) ON episodes.id = episode_id`);
    res.render('episodes', { name, episodes });
});

app.post('/user-podcasts', async(req, res) => {
    const db = await dbPromise;
    const { user_podcast_id } = req.body;
    const podcasts = await db.all(`SELECT podcasts.id, name, genre, publication_date, username FROM podcasts JOIN users ON podcasts.publisher_id = users.id WHERE publisher_id = ${user_podcast_id}`);
    console.log(`SELECT podcasts.id, name, genre, publication_date, username FROM podcasts JOIN users ON podcasts.publisher_id = users.id WHERE publisher_id = ${user_podcast_id}`);
    res.render('home', { podcasts });
});

app.post('/user-collections', async(req, res) => {
    const db = await dbPromise;
    const { user_collection_id } = req.body;
    const collections = await db.all(`SELECT * FROM collections JOIN users ON collections.creator_id = users.id WHERE creator_id = ${user_collection_id}`);
    console.log(`SELECT * FROM collections WHERE creator_id = ${user_collection_id}`);
    res.render('collections', { collections });
});

app.post('/add-podcast', async(req, res) => {
    const db = await dbPromise;
    const { name, lifestyle, comedy, science, sports, cinema, music, politics } = req.body;
    
    let genre = '';
    if (lifestyle) {
        genre = 'lifestyle';
    } else if (comedy) {
        genre = 'comedy';
    } else if (science) {
        genre = 'science';
    } else if (sports) {
        genre = 'sports';
    } else if (cinema) {
        genre = 'cinema';
    } else if (music) {
        genre = 'music';
    } else if (politics) {
        genre = 'politics';
    }

    const user_id = 1;
    const currDate = 'April 11, 2022';

    db.run('INSERT INTO podcasts (name, genre, publication_date, publisher_id) VALUES (?, ?, ?, ?)', [name, genre, currDate, user_id]);
    console.log(`INSERT INTO podcasts (name, genre, publication_date, publisher_id) VALUES ('${name}', '${genre}', '${currDate}', '${user_id}')`);
    res.redirect('/');
});

const setup = async () => {
    const db = await dbPromise;
    await db.migrate(); //runs sql only once - can undo and redo migrations
    app.listen(port, () => {console.log(`Listening on port ${port} \nQuery Log:\n`)});
}

app.post('/login', async (req, res) => {
    console.log("okay");
    res.sendStatus(200);
});

function addDisplayRuntime(episodes) {
    episodes.forEach(episode => {
        episode.displayRunTime = Math.floor(episode.runtime / 60) + 'hr:' + 
                                 ((episode.runtime % 60) < 10 ? + '0' : '') + 
                                 (episode.runtime % 60) + 'min';
    });
}

setup();