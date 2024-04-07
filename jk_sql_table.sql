create table character_on_map (
    member_id varchar2(50) NOT NULL PRIMARY KEY,
    timestamp_latest int,
    timestamp_first int,
    member_name varchar2(50),
    model_number number(2),
    map_number number(2),
    tile_number number(3),
    is_moving number(1),
    from_where number(3),
    is_flip number(1),
    is_chaton number(1),
    chat_text varchar2(100),
    is_jump number(1)
);
insert into character_on_map values (
    'memberk',
    0,
    0,
    'smile',
    1,
    0,
    189,
    0,
    0,
    0,
    0,
    '',
    0
);
insert into character_on_map values (
    'memberd',
    0,
    0,
    'star',
    2,
    0,
    120,
    0,
    0,
    0,
    0,
    '',
    0
);
insert into character_on_map values (
    'membera',
    0,
    0,
    'quick',
    3,
    0,
    53,
    0,
    0,
    0,
    0,
    '',
    0
);
insert into character_on_map values (
    'membero',
    0,
    0,
    'clumsy',
    4,
    0,
    246,
    0,
    0,
    0,
    0,
    '',
    0
);
commit;
