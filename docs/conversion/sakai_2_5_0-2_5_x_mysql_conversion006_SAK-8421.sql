--
-- SAK-8421 Forums statistics page is very slow
--
create index MFR_UNREAD_MESSAGE_C_ID on MFR_UNREAD_STATUS_T (MESSAGE_C);
create index MFR_UNREAD_TOPIC_C_ID on MFR_UNREAD_STATUS_T (TOPIC_C);
create index MFR_UNREAD_USER_C_ID on MFR_UNREAD_STATUS_T (USER_C);
create index MFR_UNREAD_READ_C_ID on MFR_UNREAD_STATUS_T (READ_C);
