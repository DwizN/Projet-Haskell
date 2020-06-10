-- create database:
-- sqlite3 movie.db < movie.sql

CREATE TABLE sujet (
  sujet_id INTEGER PRIMARY KEY AUTOINCREMENT,
  sujet_title TEXT
);

CREATE TABLE message (
  message_id INTEGER PRIMARY KEY AUTOINCREMENT,
  message_sujet INTEGER, 
  message_user TEXT,
  message_libelle TEXT,
  FOREIGN KEY(message_sujet) REFERENCES sujet(sujet_id)
);

INSERT INTO sujet VALUES(1, 'Ma super conv');
INSERT INTO sujet VALUES(2, 'Wahou je suis un stremon');

INSERT INTO message VALUES(1, 1, 'Antoine OFFROY', 'Mon sujet');
INSERT INTO message VALUES(2, 1, 'Antoine OFFROY', 'Mon sujet 2');
INSERT INTO message VALUES(3, 2, 'Albert Dupontel', 'Mon sujet 3');
INSERT INTO message VALUES(4, 2, 'Claude Perron', 'Mon sujet 2');