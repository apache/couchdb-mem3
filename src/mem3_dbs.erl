-module(mem3_dbs).

-behaviour(couch_define_db).

-export([databases/0, validate_name/1, options/1, name/1]).

databases() ->
    [name("shards_db"), name("nodes_db")].

validate_name(DbName) ->
    Name = couch_db:normalize_dbname(DbName),
    Name == name("shards_db")
        orelse Name == name("nodes_db").

options(_Name) ->
    [sys_db, local].

name("shards_db") ->
    config:get("mem3", "shards_db", "_dbs");
name("nodes_db") ->
    config:get("mem3", "nodes_db", "_nodes").
