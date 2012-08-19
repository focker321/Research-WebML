-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- VIAJE [ent1]
create table `viaje` (
   `oid`  integer  not null,
   `fecha_viaje`  date,
   `titulo_viaje`  varchar(255),
   `resumen_viaje`  varchar(255),
  primary key (`oid`)
);


-- DESTINO [ent2]
create table `destino` (
   `oid`  integer  not null,
   `promocion`  varchar(255),
   `distancia`  double precision,
   `nombre`  varchar(255),
  primary key (`oid`)
);


-- TIPO_VIAJE [ent3]
create table `tipo_viaje` (
   `oid`  integer  not null,
   `tipo`  varchar(255),
  primary key (`oid`)
);


-- INDIVIDUO [ent5]
create table `individuo` (
   `user_oid`  integer  not null,
   `oidglobal`  integer  not null,
  primary key (`user_oid`)
);


-- POST [ent6]
create table `post` (
   `oid`  integer  not null,
   `contenido`  varchar(255),
  primary key (`oid`)
);


-- TAG [ent7]
create table `tag` (
   `oid`  integer  not null,
   `nombre_tag`  varchar(255),
   `representatividad`  varchar(255),
  primary key (`oid`)
);


-- TICKET [ent8]
create table `ticket` (
   `oid`  integer  not null,
   `fecha_viaje`  date,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- DESTINO_TICKET [rel1]
alter table `viaje`  add column  `destino_oid`  integer;
alter table `viaje`   add index fk_viaje_destino (`destino_oid`), add constraint fk_viaje_destino foreign key (`destino_oid`) references `destino` (`oid`);


-- TIPO_VIAJE_TICKET [rel2]
alter table `viaje`  add column  `tipo_viaje_oid`  integer;
alter table `viaje`   add index fk_viaje_tipo_viaje (`tipo_viaje_oid`), add constraint fk_viaje_tipo_viaje foreign key (`tipo_viaje_oid`) references `tipo_viaje` (`oid`);


-- User_TICKET [rel3]
alter table `viaje`  add column  `user_oid`  integer;
alter table `viaje`   add index fk_viaje_user (`user_oid`), add constraint fk_viaje_user foreign key (`user_oid`) references `user` (`oid`);


-- POST_INDIVIDUO [rel5]
alter table `post`  add column  `individuo_oid`  integer;
alter table `post`   add index fk_post_individuo (`individuo_oid`), add constraint fk_post_individuo foreign key (`individuo_oid`) references `individuo` (`user_oid`);


-- TAG_POST [rel6]
create table `tag_post` (
   `tag_oid`  integer not null,
   `post_oid`  integer not null,
  primary key (`tag_oid`, `post_oid`)
);
alter table `tag_post`   add index fk_tag_post_tag (`tag_oid`), add constraint fk_tag_post_tag foreign key (`tag_oid`) references `tag` (`oid`);
alter table `tag_post`   add index fk_tag_post_post (`post_oid`), add constraint fk_tag_post_post foreign key (`post_oid`) references `post` (`oid`);


-- VIAJE_TICKET [rel7]
alter table `ticket`  add column  `viaje_oid`  integer;
alter table `ticket`   add index fk_ticket_viaje (`viaje_oid`), add constraint fk_ticket_viaje foreign key (`viaje_oid`) references `viaje` (`oid`);


-- GEN FK: INDIVIDUO --> User
alter table `individuo`   add index fk_individuo_user (`user_oid`), add constraint fk_individuo_user foreign key (`user_oid`) references `user` (`oid`);


