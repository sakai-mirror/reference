-- SAK-10454: Added indexes to imporve Samigo performance
create index SAM_ASSGRAD_AID_PUBASSEID_T on SAM_ASSESSMENTGRADING_T (AGENTID,PUBLISHEDASSESSMENTID);
