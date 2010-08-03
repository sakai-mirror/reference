--
-- SAK-13445 Missing index for Search tool
--
--
-- SAK-13345 introduced a performance optimization to the search tool
-- To see if you need this index, run this command:
--
-- select INDEX_NAME FROM USER_INDEXES WHERE INDEX_NAME='ISEARCHBUILDERITEM_STA';
--
-- If there is 1 row returned then you should run the
-- following queries:
--
create index ISEARCHBUILDERITEM_STA_ACT on searchbuilderitem (SEARCHSTATE,SEARCHACTION);
drop index ISEARCHBUILDERITEM_STA; 
