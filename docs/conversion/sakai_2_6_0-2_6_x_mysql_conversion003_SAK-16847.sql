-- Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB.

-- SAK-16847  asn.share.drafts permission should be added into 2.6.1 conversion script
-- This might have been added with the 2.6.0 conversion but was added after release

-- Don't do anything if the function already exists 
INSERT INTO SAKAI_REALM_FUNCTION VALUES (DEFAULT, 'asn.share.drafts') on duplicate key update function_name=function_name;
