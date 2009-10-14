-- Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB.
 
-- SAK-16668
-- Note: If you upgraded to sakai 2.6.0 PRIOR TO September 1st 2009 you'll need to run this column conversion.
-- You should probably check your columns as they should be converted from varchar to text
-- (Or just run them anyway as it is safe to rerun, which is why they are uncommented)
ALTER TABLE ASN_MA_ITEM_T CHANGE TEXT TEXT TEXT;
ALTER TABLE ASN_NOTE_ITEM_T CHANGE NOTE NOTE TEXT;
