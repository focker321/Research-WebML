-- Group [Group]
create table `group_2` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module_2` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user_2` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- TICKET [ent1]
create table `ticket_2` (
   `oid`  integer  not null,
   `fecha_compra`  date,
   `fecha_viaje`  date,
  primary key (`oid`)
);


-- DESTINO [ent2]
create table `destino_2` (
   `oid`  integer  not null,
   `promocion`  varchar(255),
   `distancia`  double precision,
   `nombre`  varchar(255),
  primary key (`oid`)
);


-- TIPO_VIAJE [ent3]
create table `tipo_viaje_2` (
   `oid`  integer  not null,
   `attribute6`  varchar(255),
  primary key (`oid`)
);


-- INDIVIDUO [ent5]
create table `individuo_2` (
   `user_2_oid`  integer  not null,
   `oidglobal`  integer  not null,
  primary key (`user_2_oid`)
);


-- POST [ent6]
create table `post_2` (
   `oid`  integer  not null,
   `contenido`  varchar(255),
  primary key (`oid`)
);


-- TAG [ent7]
create table `tag_2` (
   `oid`  integer  not null,
   `nombre_tag`  varchar(255),
   `representatividad`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group_2`  add column  `module_2_oid`  integer;
alter table `group_2`   add index fk_group_2_module_2 (`module_2_oid`), add constraint fk_group_2_module_2 foreign key (`module_2_oid`) references `module_2` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module_2` (
   `group_2_oid`  integer not null,
   `module_2_oid`  integer not null,
  primary key (`group_2_oid`, `module_2_oid`)
);
alter table `group_module_2`   add index fk_group_module_2_group_2 (`group_2_oid`), add constraint fk_group_module_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);
alter table `group_module_2`   add index fk_group_module_2_module_2 (`module_2_oid`), add constraint fk_group_module_2_module_2 foreign key (`module_2_oid`) references `module_2` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_2`  add column  `group_2_oid`  integer;
alter table `user_2`   add index fk_user_2_group_2 (`group_2_oid`), add constraint fk_user_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_2` (
   `user_2_oid`  integer not null,
   `group_2_oid`  integer not null,
  primary key (`user_2_oid`, `group_2_oid`)
);
alter table `user_group_2`   add index fk_user_group_2_user_2 (`user_2_oid`), add constraint fk_user_group_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);
alter table `user_group_2`   add index fk_user_group_2_group_2 (`group_2_oid`), add constraint fk_user_group_2_group_2 foreign key (`group_2_oid`) references `group_2` (`oid`);


-- DESTINO_TICKET [rel1]
alter table `ticket_2`  add column  `destino_2_oid`  integer;
alter table `ticket_2`   add index fk_ticket_2_destino_2 (`destino_2_oid`), add constraint fk_ticket_2_destino_2 foreign key (`destino_2_oid`) references `destino_2` (`oid`);


-- TIPO_VIAJE_TICKET [rel2]
alter table `ticket_2`  add column  `tipo_viaje_2_oid`  integer;
alter table `ticket_2`   add index fk_ticket_2_tipo_viaje_2 (`tipo_viaje_2_oid`), add constraint fk_ticket_2_tipo_viaje_2 foreign key (`tipo_viaje_2_oid`) references `tipo_viaje_2` (`oid`);


-- User_TICKET [rel3]
alter table `ticket_2`  add column  `user_2_oid`  integer;
alter table `ticket_2`   add index fk_ticket_2_user_2 (`user_2_oid`), add constraint fk_ticket_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


-- POST_INDIVIDUO [rel5]
alter table `post_2`  add column  `individuo_2_oid`  integer;
alter table `post_2`   add index fk_post_2_individuo_2 (`individuo_2_oid`), add constraint fk_post_2_individuo_2 foreign key (`individuo_2_oid`) references `individuo_2` (`user_2_oid`);


-- TAG_POST [rel6]
create table `tag_post_2` (
   `tag_2_oid`  integer not null,
   `post_2_oid`  integer not null,
  primary key (`tag_2_oid`, `post_2_oid`)
);
alter table `tag_post_2`   add index fk_tag_post_2_tag_2 (`tag_2_oid`), add constraint fk_tag_post_2_tag_2 foreign key (`tag_2_oid`) references `tag_2` (`oid`);
alter table `tag_post_2`   add index fk_tag_post_2_post_2 (`post_2_oid`), add constraint fk_tag_post_2_post_2 foreign key (`post_2_oid`) references `post_2` (`oid`);


-- GEN FK: INDIVIDUO --> User
alter table `individuo_2`   add index fk_individuo_2_user_2 (`user_2_oid`), add constraint fk_individuo_2_user_2 foreign key (`user_2_oid`) references `user_2` (`oid`);


