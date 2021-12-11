create table budget(
    codename varchar(255) primary key,
    daily_limit integer
);

create table category(
    codename varchar(255) primary key,
    name varchar(255),
    is_base_expense boolean,
    aliases text
);

create table expense(
    id integer primary key,
    amount integer,
    created datetime,
    category_codename integer,
    raw_text text,
    FOREIGN KEY(category_codename) REFERENCES category(codename)
);

insert into category (codename, name, is_base_expense, aliases)
values
    ("products", "продукты", true, "еда, провизия, food, пища, продовольствие, ням-ням"),
    ("coffee", "кофе", true, ""),
    ("dinner", "обед", true, "столовая, ланч, бизнес-ланч, перекус"),
    ("cafe", "кафе", true, "ресторан, фастфуд"),
    ("transport", "общ. транспорт", false, "метро, автобус, metro, subway, самолет, самокат, велосипед"),
    ("taxi", "такси", false, "яндекс такси, yandex taxi, ситимобил, таксичкофф"),
    ("phone", "телефон", false, "мобильный, оператор, связь"),
    ("books", "книги", false, "литература, просвещение, образование"),
    ("internet", "интернет", false, "инет, inet, вай-фай, wi-fi"),
    ("subscriptions", "подписки", false, "подписка, yandex, kinopoisk, кинопоиск, музыка, youtube"),
    ("courses", "курсы", false, "хекслет, яндекс практикум, курсера, coursera, udemy");
    ("programms", "программы", false, "фотошоп, 3Dcoat, zbrush, substain, marvelousDesigner, clipStudioPaint, illustrator, marmoset, clion, pycharm");
    ("other", "прочее", true, "");

insert into budget(codename, daily_limit) values ('base', 500);
