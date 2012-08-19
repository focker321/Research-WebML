-- TICKET [ent8]
create table `ticket_2` (
   `oid`  integer  not null,
   `fecha_viaje`  date,
  primary key (`oid`)
);


-- VIAJE [ent1]
alter table `ticket`  add column  `titulo_viaje`  varchar(255);
alter table `ticket`  add column  `resumen_viaje`  varchar(255);


-- VIAJE_TICKET [rel7]
alter table `ticket_2`  add column  `ticket_oid`  integer;
alter table `ticket_2`   add index fk_ticket_2_ticket (`ticket_oid`), add constraint fk_ticket_2_ticket foreign key (`ticket_oid`) references `ticket` (`oid`);


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


-- REL FK: DESTINOToTICKET [rel1#role1]
alter table `ticket`   add index fk_ticket_destino (`destino_oid`), add constraint fk_ticket_destino foreign key (`destino_oid`) references `destino` (`oid`);


-- REL FK: TIPO_VIAJEToTICKET [rel2#role3]
alter table `ticket`   add index fk_ticket_tipo_viaje (`tipo_viaje_oid`), add constraint fk_ticket_tipo_viaje foreign key (`tipo_viaje_oid`) references `tipo_viaje` (`oid`);


-- REL FK: UserToTICKET [rel3#role5]
alter table `ticket`   add index fk_ticket_user (`user_oid`), add constraint fk_ticket_user foreign key (`user_oid`) references `user` (`oid`);


-- REL FK: INDIVIDUOToPOST [rel5#role10]
alter table `post`   add index fk_post_individuo (`individuo_oid`), add constraint fk_post_individuo foreign key (`individuo_oid`) references `individuo` (`user_oid`);


-- REL FK: TAGToPOST [rel6#role11]
alter table `tag_post`   add index fk_tag_post_tag (`tag_oid`), add constraint fk_tag_post_tag foreign key (`tag_oid`) references `tag` (`oid`);


-- REL FK: POSTToTAG [rel6#role12]
alter table `tag_post`   add index fk_tag_post_post (`post_oid`), add constraint fk_tag_post_post foreign key (`post_oid`) references `post` (`oid`);


