-- SAK-9808: Implement ability to delete threaded messages within Forums
alter table MFR_MESSAGE_T add DELETED number(1, 0) default '0' not null;
update MFR_MESSAGE_T set DELETED=0 where DELETED is NULL;
create index MFR_MESSAGE_DELETED_I on MFR_MESSAGE_T (DELETED);