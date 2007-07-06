-- SAK-9808: Implement ability to delete threaded messages within Forums
alter table MFR_MESSAGE_T add DELETED bit not null default false;
create index MFR_MESSAGE_DELETED_I on MFR_MESSAGE_T (DELETED);