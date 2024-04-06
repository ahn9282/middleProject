desc simple_board_1;

select * from simple_board_1;
select * from simple_board_1 where postid = 26;


desc emp;



create table t1 (
    count int
);

commit;

desc t1;

select * from t1;

insert into t1 values (0);

select * from simple_board_1 order by postid desc;

update t1 set count = 3;

desc emp;

drop table t2;
create table t2 (
    nickname varchar2(50),
    modelnumber number(2),
    mapnumber number(2),
    tilenumber number(2),
    isflip number(1),
    islogin number(1),
    ischaton number(1),
    chattext varchar2(100),
    isjump number(1)
);

desc t2;
select * from t2;

commit;

drop table characteronmap;
create table characteronmap (
    nickname varchar2(50),
    modelnumber number(2),
    mapnumber number(2),
    tilenumber number(2),
    ismoving number(1),
    fromwhere number(2),
    isflip number(1),
    islogin number(1),
    ischaton number(1),
    chattext varchar2(100),
    isjump number(1)
);
desc characteronmap;
select * from characteronmap;


create table characteronmap2 (
    timestamprefesh int,
    timestampfirst int,
    nickname varchar2(50),
    modelnumber number(2),
    mapnumber number(2),
    tilenumber number(2),
    ismoving number(1),
    fromwhere number(2),
    isflip number(1),
    islogin number(1),
    ischaton number(1),
    chattext varchar2(100),
    isjump number(1)
);
desc characteronmap2;


SELECT
     EXTRACT(DAY FROM(sys_extract_utc(systimestamp) - to_timestamp('1970-01-01', 'YYYY-MM-DD'))) * 86400000
    + to_number(TO_CHAR(sys_extract_utc(systimestamp), 'SSSSSFF3'))
  FROM dual;

select 1+1 from dual;

desc dual;

select * from dual;

insert into t1 values (EXTRACT(DAY FROM(sys_extract_utc(systimestamp) - to_timestamp('1970-01-01', 'YYYY-MM-DD'))) * 86400000
    + to_number(TO_CHAR(sys_extract_utc(systimestamp), 'SSSSSFF3')));

select * from t1;

commit;

drop table characteronmap3;
create table characteronmap3 (
    /*islogin number(1),*/
    member_id varchar2(50),
    timestamp_latest int,
    timestamp_first int,
    member_name varchar2(50),
    model_number number(2),
    map_number number(2),
    tile_number number(2),
    is_moving number(1),
    from_where number(2),
    is_flip number(1),
    is_chaton number(1),
    chat_text varchar2(100),
    is_jump number(1)
);
desc characteronmap3;
select * from characteronmap3;

insert into characteronmap3 (
    member_id, 
    timestamp_latest, 
    timestamp_first, 
    member_name, 
    model_number, 
    map_number, 
    tile_number, 
    is_moving, 
    from_where, 
    is_flip, 
    is_chaton, 
    chat_text, 
    is_jump
) values (
    'membero',
    '0',
    '0',
    'jk',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    'hi',
    '0'
);

commit;

insert into characteronmap3 values (
    'membero',
    0,
    0,
    'jk',
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    'hi',
    0
);

desc emp;
desc dept;

drop table characteronmap4;
create table characteronmap4 (
    member_id varchar2(50) NOT NULL PRIMARY KEY,
    timestamp_latest int,
    timestamp_first int,
    member_name varchar2(50),
    model_number number(2),
    map_number number(2),
    tile_number number(3),
    is_moving number(1),
    from_where number(2),
    is_flip number(1),
    is_chaton number(1),
    chat_text varchar2(100),
    is_jump number(1)
);
desc characteronmap4;
select * from characteronmap4;

insert into characteronmap4 values (
    'membero',
    0,
    0,
    '???',
    4,
    0,
    0,
    0,
    0,
    0,
    0,
    '',
    0
);
commit;

update characteronmap4 set chat_text = '' where member_id = 'membero';

update characteronmap4 set tile_number = '189' where member_id = 'membero';


drop table character_on_map;
create table character_on_map (
    member_id varchar2(50) NOT NULL PRIMARY KEY,
    timestamp_latest int,
    timestamp_first int,
    member_name varchar2(50),
    model_number number(2),
    map_number number(2),
    tile_number number(3),
    is_moving number(1),
    from_where number(2),
    is_flip number(1),
    is_chaton number(1),
    chat_text varchar2(100),
    is_jump number(1)
);
desc character_on_map;
select * from character_on_map;

commit;

insert into character_on_map values (
    'memberk',
    0,
    0,
    '???',
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
    '???',
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
    '???',
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
    '???',
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

select * from character_on_map;
select tile_number from character_on_map;

desc character_on_map;

select * from t1;

delete character_on_map where member_id = 'test';

insert into character_on_map values (
    'test',
    0,
    0,
    'ttt',
    5,
    0,
    107,
    0,
    0,
    0,
    0,
    '',
    0
);

/*
    member_id varchar2(50) NOT NULL PRIMARY KEY,
    timestamp_latest int,
    timestamp_first int,
    member_name varchar2(50),
    model_number number(2),
    map_number number(2),
    tile_number number(3),
    is_moving number(1),
    from_where number(2),
    is_flip number(1),
    is_chaton number(1),
    chat_text varchar2(100),
    is_jump number(1)
*/


desc character_on_map;

select * from character_on_map;

update character_on_map set 
    timestamp_latest = 0,
    timestamp_first = 0,
    member_name = 'ttt',
    model_number = 5,
    map_number = 0,
    tile_number = 164,
    is_moving = 0,
    from_where = 0,
    is_flip = 0,
    is_chaton = 0,
    chat_text = '',
    is_jump = 0
where member_id = 'test';

commit;

update character_on_map set tile_number = tile_number + 1 where member_id = 'membero';
update character_on_map set tile_number = tile_number - 1 where member_id = 'membero';
update character_on_map set tile_number = tile_number - 16 where member_id = 'membero';
update character_on_map set tile_number = tile_number + 16 where member_id = 'membero';

select * from character_on_map where member_id = 'membero';
select * from character_on_map where member_id = 'memberk';

update character_on_map set tile_number = tile_number + 1 where member_id = 'memberk';
update character_on_map set tile_number = tile_number - 1 where member_id = 'memberk';
update character_on_map set tile_number = tile_number - 16 where member_id = 'memberk';
update character_on_map set tile_number = tile_number + 16 where member_id = 'memberk';

commit;




select * from character_on_map;



