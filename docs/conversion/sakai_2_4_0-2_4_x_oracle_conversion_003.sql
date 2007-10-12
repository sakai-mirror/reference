--Chat SAK-10163
ALTER TABLE CHAT2_CHANNEL ADD PLACEMENT_ID varchar2(99) NULL;
ALTER TABLE CHAT2_CHANNEL RENAME COLUMN contextDefaultChannel TO placementDefaultChannel;

update CHAT2_CHANNEL cc
set cc.PLACEMENT_ID = (select st.TOOL_ID from SAKAI_SITE_TOOL st where st.REGISTRATION = 'sakai.chat' 
   and cc.placementDefaultChannel = 1
   and cc.CONTEXT = st.SITE_ID and ROWNUM = 1)
where EXISTS 
(select st.TOOL_ID from SAKAI_SITE_TOOL st where st.REGISTRATION = 'sakai.chat' 
   and cc.placementDefaultChannel = 1
   and cc.CONTEXT = st.SITE_ID and ROWNUM = 1);

update CHAT2_CHANNEL set placementDefaultChannel=0 where placementDefaultChannel is null;

