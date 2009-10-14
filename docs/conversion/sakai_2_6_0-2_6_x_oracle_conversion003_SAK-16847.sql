-- Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB.  

-- SAK-16847  asn.share.drafts permission should be added into 2.6.1 conversion script
-- This might have been added with the 2.6.0 conversion but was added after release

MERGE INTO SAKAI_REALM_FUNCTION a USING (
     SELECT 'asn.share.drafts' as FUNCTION_NAME from dual) b
 ON (a.FUNCTION_NAME = b.FUNCTION_NAME)
 WHEN NOT MATCHED THEN INSERT (FUNCTION_KEY,FUNCTION_NAME) VALUES (SAKAI_REALM_FUNCTION_SEQ.NEXTVAL, 'asn.share.drafts');
