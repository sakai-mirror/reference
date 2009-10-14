-- Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB. 

-- Two recent Jira's (http://jira.sakaiproject.org/browse/SAK-17061) and (http://jira.sakaiproject.org/browse/PRFL-97) 
-- have uncovered that when the field 'locked' was added to the SAKAI_PERSON_T a while ago 
-- (before 2.5.0 was cut), there was no DB upgrade script added to upgrade existing entries. 

-- Here is the Jira that added the locked field: http://jira.sakaiproject.org/browse SAK-10512

--As such, this field is null for old profiles. Its set correctly for any new profiles but all old entries need to be converted.

update SAKAI_PERSON_T set locked=false where locked=null; 
