--Chat SAK-10163
ALTER TABLE CHAT2_CHANNEL ADD COLUMN PLACEMENT_ID varchar(99) NULL;
ALTER TABLE CHAT2_CHANNEL CHANGE contextDefaultChannel placementDefaultChannel tinyint(1) NULL;

update CHAT2_CHANNEL cc, SAKAI_SITE_TOOL st
set cc.PLACEMENT_ID = st.TOOL_ID
where st.REGISTRATION = 'sakai.chat' 
   and cc.placementDefaultChannel = true
   and cc.CONTEXT = st.SITE_ID;

update CHAT2_CHANNEL set placementDefaultChannel=false where placementDefaultChannel is null;

