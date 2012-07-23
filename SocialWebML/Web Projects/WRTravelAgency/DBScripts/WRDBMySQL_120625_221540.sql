-- TICKET [ent1]
create table `ticket` (
   `oid`  integer  not null,
   `fecha_compra`  date,
   `fecha_viaje`  date,
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
   `attribute6`  varchar(255),
  primary key (`oid`)
);


-- DESTINO_TICKET [rel1]
alter table `ticket`  add column  `destino_oid`  integer;
alter table `ticket`   add index fk_ticket_destino (`destino_oid`), add constraint fk_ticket_destino foreign key (`destino_oid`) references `destino` (`oid`);


-- TIPO_VIAJE_TICKET [rel2]
alter table `ticket`  add column  `tipo_viaje_oid`  integer;
alter table `ticket`   add index fk_ticket_tipo_viaje (`tipo_viaje_oid`), add constraint fk_ticket_tipo_viaje foreign key (`tipo_viaje_oid`) references `tipo_viaje` (`oid`);


-- User_TICKET [rel3]
alter table `ticket`  add column  `user_oid`  integer;
alter table `ticket`   add index fk_ticket_user (`user_oid`), add constraint fk_ticket_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: INDIVIDUO --> User
alter table `individuo`   add index fk_individuo_user (`user_oid`), add constraint fk_individuo_user foreign key (`user_oid`) references `user` (`oid`);


-- REL FK: defaultGroups [DefaultModule2Group]
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- REL FK: modules [Group2Module]
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);


-- REL FK: groups [Module2Group]
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- REL FK: defaultUsers [DefaultGroup2User]
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- REL FK: groups [User2Group]
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);


-- REL FK: users [Group2User]
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- REL FK: INDIVIDUOToPOST [rel5#role10]
alter table `post`   add index fk_post_individuo (`individuo_oid`), add constraint fk_post_individuo foreign key (`individuo_oid`) references `individuo` (`user_oid`);


-- REL FK: TAGToPOST [rel6#role11]
alter table `tag_post`   add index fk_tag_post_tag (`tag_oid`), add constraint fk_tag_post_tag foreign key (`tag_oid`) references `tag` (`oid`);


-- REL FK: POSTToTAG [rel6#role12]
alter table `tag_post`   add index fk_tag_post_post (`post_oid`), add constraint fk_tag_post_post foreign key (`post_oid`) references `post` (`oid`);


