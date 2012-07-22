-- Group [Group]
create table `GROUP_3` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `MODULE_3` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `USER_3` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- INDIVIDUO [ent5]
create table `INDIVIDUO_2` (
   `user_3_oid`  integer  not null,
   `oidglobal`  integer  not null,
  primary key (`user_3_oid`)
);


-- POST [ent6]
create table `POST_2` (
   `oid`  integer  not null,
   `contenido`  varchar(255),
  primary key (`oid`)
);


-- TAG [ent7]
create table `TAG_2` (
   `oid`  integer  not null,
   `nombre_tag`  varchar(255),
   `representatividad`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `GROUP_3`  add column  `MODULE_3_OID`  integer;
alter table `GROUP_3`   add index fk_group_3_module_3 (`MODULE_3_OID`), add constraint fk_group_3_module_3 foreign key (`MODULE_3_OID`) references `MODULE_3` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `GROUP_MODULE_3` (
   `GROUP_3_OID`  integer not null,
   `MODULE_3_OID`  integer not null,
  primary key (`GROUP_3_OID`, `MODULE_3_OID`)
);
alter table `GROUP_MODULE_3`   add index fk_group_module_3_group_3 (`GROUP_3_OID`), add constraint fk_group_module_3_group_3 foreign key (`GROUP_3_OID`) references `GROUP_3` (`oid`);
alter table `GROUP_MODULE_3`   add index fk_group_module_3_module_3 (`MODULE_3_OID`), add constraint fk_group_module_3_module_3 foreign key (`MODULE_3_OID`) references `MODULE_3` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `USER_3`  add column  `GROUP_3_OID`  integer;
alter table `USER_3`   add index fk_user_3_group_3 (`GROUP_3_OID`), add constraint fk_user_3_group_3 foreign key (`GROUP_3_OID`) references `GROUP_3` (`oid`);


-- User_Group [User2Group_Group2User]
create table `USER_GROUP_3` (
   `USER_3_OID`  integer not null,
   `GROUP_3_OID`  integer not null,
  primary key (`USER_3_OID`, `GROUP_3_OID`)
);
alter table `USER_GROUP_3`   add index fk_user_group_3_user_3 (`USER_3_OID`), add constraint fk_user_group_3_user_3 foreign key (`USER_3_OID`) references `USER_3` (`oid`);
alter table `USER_GROUP_3`   add index fk_user_group_3_group_3 (`GROUP_3_OID`), add constraint fk_user_group_3_group_3 foreign key (`GROUP_3_OID`) references `GROUP_3` (`oid`);


-- POST_INDIVIDUO [rel5]
alter table `POST_2`  add column  `INDIVIDUO_2_OID`  integer;
alter table `POST_2`   add index fk_post_2_individuo_2 (`INDIVIDUO_2_OID`), add constraint fk_post_2_individuo_2 foreign key (`INDIVIDUO_2_OID`) references `INDIVIDUO_2` (`user_3_oid`);


-- TAG_POST [rel6]
create table `TAG_POST_2` (
   `TAG_2_OID`  integer not null,
   `POST_2_OID`  integer not null,
  primary key (`TAG_2_OID`, `POST_2_OID`)
);
alter table `TAG_POST_2`   add index fk_tag_post_2_tag_2 (`TAG_2_OID`), add constraint fk_tag_post_2_tag_2 foreign key (`TAG_2_OID`) references `TAG_2` (`oid`);
alter table `TAG_POST_2`   add index fk_tag_post_2_post_2 (`POST_2_OID`), add constraint fk_tag_post_2_post_2 foreign key (`POST_2_OID`) references `POST_2` (`oid`);


-- GEN FK: INDIVIDUO --> User
alter table `INDIVIDUO_2`   add index fk_individuo_2_user_3 (`user_3_oid`), add constraint fk_individuo_2_user_3 foreign key (`user_3_oid`) references `USER_3` (`oid`);


