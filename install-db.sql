--
-- File generated with SQLiteStudio v3.2.1 on Mon May 18 19:26:51 2020
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: entrants
DROP TABLE IF EXISTS entrants;

CREATE TABLE entrants (
    id           INTEGER       PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                               UNIQUE ON CONFLICT FAIL
                               NOT NULL ON CONFLICT FAIL,
    discord_id   INTEGER       UNIQUE ON CONFLICT FAIL
                               NOT NULL ON CONFLICT FAIL,
    discord_name VARCHAR (100) NOT NULL ON CONFLICT FAIL
                               COLLATE NOCASE,
    twitch_name  VARCHAR (25)  UNIQUE ON CONFLICT FAIL
);

-- Table: events
DROP TABLE IF EXISTS events;

CREATE TABLE events (
    id          INTEGER       PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                              UNIQUE ON CONFLICT FAIL
                              NOT NULL ON CONFLICT FAIL,
    shortname   VARCHAR (200) UNIQUE ON CONFLICT FAIL
                              NOT NULL ON CONFLICT FAIL
                              COLLATE NOCASE,
    displayname VARCHAR (200) NOT NULL ON CONFLICT FAIL,
    eventdate   DATETIME      NOT NULL ON CONFLICT FAIL
);

-- Table: questions
DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id   INTEGER       PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                       UNIQUE ON CONFLICT FAIL
                       NOT NULL ON CONFLICT FAIL,
    text VARCHAR (400) UNIQUE ON CONFLICT FAIL
                       NOT NULL ON CONFLICT FAIL
                       COLLATE NOCASE
);

-- Table: round_types
DROP TABLE IF EXISTS round_types;

CREATE TABLE round_types (
    id          INTEGER       PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                              UNIQUE ON CONFLICT FAIL
                              NOT NULL ON CONFLICT FAIL,
    shortname   VARCHAR (20)  UNIQUE ON CONFLICT FAIL
                              NOT NULL ON CONFLICT FAIL,
    displayname VARCHAR (200) NOT NULL ON CONFLICT FAIL
);

-- Table: event_entrants
DROP TABLE IF EXISTS event_entrants;

CREATE TABLE event_entrants (
    id         INTEGER PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                       UNIQUE ON CONFLICT FAIL
                       NOT NULL ON CONFLICT FAIL,
    event_id   INTEGER REFERENCES events (id) 
                       NOT NULL ON CONFLICT FAIL,
    entrant_id INTEGER REFERENCES entrants (id) 
                       NOT NULL ON CONFLICT FAIL
);

-- Table: event_rounds
DROP TABLE IF EXISTS event_rounds;

CREATE TABLE event_rounds (
    id       INTEGER PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                     UNIQUE ON CONFLICT FAIL
                     NOT NULL ON CONFLICT FAIL,
    event_id INTEGER REFERENCES events (id) 
                     NOT NULL ON CONFLICT FAIL,
    round_id INTEGER REFERENCES round_types (id) 
                     NOT NULL ON CONFLICT FAIL
);

-- Table: event_responses
DROP TABLE IF EXISTS event_responses;

CREATE TABLE event_responses (
    id          INTEGER       PRIMARY KEY ASC ON CONFLICT FAIL AUTOINCREMENT
                              UNIQUE ON CONFLICT FAIL
                              NOT NULL ON CONFLICT FAIL,
    question_id INTEGER       REFERENCES questions (id) 
                              NOT NULL ON CONFLICT FAIL,
    entrant_id  INTEGER       REFERENCES entrants (id) 
                              NOT NULL ON CONFLICT FAIL,
    repsonse    VARCHAR (500) NOT NULL ON CONFLICT FAIL
                              COLLATE NOCASE,
    round_id    INTEGER       REFERENCES event_rounds (id) 
                              NOT NULL ON CONFLICT FAIL
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
