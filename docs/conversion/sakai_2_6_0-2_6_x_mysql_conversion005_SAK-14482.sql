-----------------------------------------------------------------------------
-- Fix http://bugs.sakaiproject.org/jira/browse/SAK-14482
-- 
-- Mercury site has old assignments tool
-- 
-- The 'mercury' site has the old sakai.assignment tool which is not
-- available in 2.5 anymore (and thus has no icon and clicking on it
-- does nothing). This replaces it with the sakai.assignment.grades tool
-- Also patches the !worksite whcih suffers from the same problem.
-----------------------------------------------------------------------------


-- update Mercury site
UPDATE SAKAI_SITE_TOOL SET REGISTRATION='sakai.assignment.grades' WHERE REGISTRATION='sakai.assignment' AND SITE_ID='mercury';

-- update !worksite site
UPDATE SAKAI_SITE_TOOL SET REGISTRATION='sakai.assignment.grades' WHERE REGISTRATION='sakai.assignment' AND SITE_ID='!worksite';
