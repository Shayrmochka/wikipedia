const mysql = require("mysql2");
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
app.use(express.json())
app.use(bodyParser.urlencoded({
  extended: true
}));
//const urlencodedParser = bodyParser.urlencoded({extended: true});

const pool = mysql.createPool({
  connectionLimit: 5,
  host: "localhost",
  user: "root",
  database: "wikipedia",
  password: "password",
  timezone: 'UTC + 0'
});

app.set("view engine", "hbs");
app.use(express.static('./'));
// app.get('/',function(req,res) {
//   res.sendFile('./index.html');
// });
const SELECT_ALL_USERS = `
                    SELECT users.*, role, us_status, ucity_name, ucountry_name FROM wikipedia.users
                    JOIN users_role ON u_role_id = ur_id
                    JOIN users_status ON u_status_id = us_id
                    JOIN users_city ON u_city_id = ucity_id
                    JOIN users_country ON ucity_country_id = ucountry_id
                    ;
                  `

const SELECT_ALL_ARTICLES = `
                            SELECT article.*, users.u_id, users.u_image, users.u_firstName_EN, users.u_lastName_EN, users.u_nickname, role, al_lang, as_name_subcategory, ac_category_name FROM wikipedia.article
                            JOIN article_language ON a_language_id = al_id
                            JOIN article_subcategory ON a_subcategory_id = as_id
                            JOIN article_category ON as_category_id = ac_id
                            JOIN users ON a_users_id = u_id
                            JOIN users_role ON u_role_id = ur_id
                            `

const SELECT_ALL_NEWS = `
                            SELECT news.*, users.u_id, users.u_image, users.u_firstName_EN, users.u_lastName_EN, users.u_nickname, role FROM wikipedia.news
                            JOIN users ON n_user_id = u_id
                            JOIN users_role ON u_role_id = ur_id
                            `
// получение списка пользователей
app.get("/users", function (req, res) {
  pool.query(SELECT_ALL_USERS, function (err, data) {
    res.json(data);
    //   if(err) return console.log(err);
    //   res.render("login.html", {
    //       users: data
    //   });
    //console.log(data)
  });
});

app.get("/articles", function (req, res) {
  pool.query(SELECT_ALL_ARTICLES, function (err, data) {
    res.json(data);
    //   if(err) return console.log(err);
    //   res.render("login.html", {
    //       users: data
    //   });
    //console.log(data)
  });
});

app.get("/news", function (req, res) {
  pool.query(SELECT_ALL_NEWS, function (err, data) {
    res.json(data);
    //   if(err) return console.log(err);
    //   res.render("login.html", {
    //       users: data
    //   });
    //console.log(data)
  });
});

app.post("/contact", function (req, res) {

  if (!req.body) return res.sendStatus(400);
  console.log(req.body)
  const c_description = req.body.data;
  const c_type_id = req.body.type;
  const c_status_id = req.body.status;
  const c_user_id = req.body.user;
  

  pool.query("INSERT INTO contact (c_description, c_type_id, c_status_id, c_user_id) VALUES (?,?,?, ?)", [c_description, c_type_id, c_status_id, c_user_id], function (err, data) {
    if (err) return console.log(err);
    res.redirect("/");
  });
});

app.post("/create", function (req, res) {

  if (!req.body) return res.sendStatus(400);
  console.log(req.body)
  const firstName_EN = req.body.firstName_EN;
  const lastName_EN = req.body.lastName_EN;
  const firstName_RU = req.body.firstName_RU;
  const lastName_RU = req.body.lastName_RU;
  const gender = req.body.gender;
  const password = req.body.password;
  const role = req.body.role;
  const worker_type = req.body.worker_type;
  const image = '/images/default.jpg';

  pool.query("INSERT INTO users (u_firstName_EN, u_lastName_EN, u_firstName_RU, u_lastName_RU, u_gender, u_password, u_worker_type, u_image) VALUES (?,?,?,?,?,?,?,?)", [firstName_EN, lastName_EN, firstName_RU, lastName_RU, gender, password, worker_type, image], function (err, data) {
    if (err) return console.log(err);
    res.redirect("/");
  });
});

app.post("/create-article", function (req, res) {
  console.log(req)
  if (!req.body) return res.sendStatus(400);
  console.log(req.body)
  const a_name = req.body.a_name;
  const a_full_name = req.body.a_full_name;
  const a_short_desc = req.body.a_short_desc;
  const a_description_1 = req.body.a_description_1;
  const a_description_2 = req.body.a_description_2;
  const a_description_3 = req.body.a_description_3;
  const a_users_id = req.body.a_users_id;
  const a_image = '/images/articles/11.jpg';

  pool.query("INSERT INTO article (a_name, a_full_name, a_short_desc, a_description_1, a_description_2, a_description_3, a_users_id, a_image) VALUES (?,?,?,?,?,?,?,?)", [a_name, a_full_name, a_short_desc, a_description_1, a_description_2, a_description_3, a_users_id, a_image], function (err, data) {
    if (err) return console.log(err);
    res.redirect("/");
  });
});

// получаем отредактированные данные и отправляем их в БД
app.post("/edit", function (req, res) {
  if (!req.body) return res.sendStatus(400);
  const firstName_EN = req.body.firstName_EN;
  const lastName_EN = req.body.lastName_EN;
  const firstName_RU = req.body.firstName_RU;
  const lastName_RU = req.body.lastName_RU;
  const gender = req.body.gender;
  const password = req.body.password;
  const worker_type = req.body.worker_type;
  const department = req.body.department
  const room = req.body.room
  const internal_phone = req.body.internal_phone
  const mobile_phone = req.body.mobile_phone
  const email = req.body.email
  const skype = req.body.skype
  const c_number = req.body.c_number

  pool.query("UPDATE users SET u_firstName_EN=?, u_lastName_EN=?, u_firstName_RU=?, u_lastName_RU=?, u_gender=?, u_password=?, u_worker_type=?, u_department=?, u_room=?, u_internal_phone=?, u_mobile_phone=?, u_email=?, u_skype=? WHERE u_c_number=?", [firstName_EN, lastName_EN, firstName_RU, lastName_RU, gender, password, worker_type, department, room, internal_phone, mobile_phone, email, skype, c_number], function (err, data) {
    if (err) return console.log(err);
    res.redirect("/");
  });
});

app.post("/edit-article", function (req, res) {
  console.log(req)
  if (!req.body) return res.sendStatus(400);
  const a_id = req.body.a_id
  const a_name = req.body.a_name;
  const a_full_name = req.body.a_full_name;
  const a_short_desc = req.body.a_short_desc;
  const a_description_1 = req.body.a_description_1;
  const a_description_2 = req.body.a_description_2;
  const a_description_3 = req.body.a_description_3;

  pool.query("UPDATE article SET a_name=?, a_full_name=?, a_short_desc=?, a_description_1=?, a_description_2=?, a_description_3=? WHERE a_id=?", [a_name, a_full_name, a_short_desc, a_description_1, a_description_2, a_description_3, a_id], function (err, data) {
    if (err) return console.log(err);
    res.redirect("/");
  });
});


app.post("/role", function (req, res) {

  if (!req.body) return res.sendStatus(400);
  console.log(req.body)
  const role = req.body.role;
  const id = req.body.id

  pool.query("UPDATE users SET u_role_id=? WHERE u_id=?", [role, id], function (err, data) {
    if (err) return console.log(err);
    res.redirect("/");
  });
});


app.listen(4000, function () {
  console.log("Сервер ожидает подключения...");
});