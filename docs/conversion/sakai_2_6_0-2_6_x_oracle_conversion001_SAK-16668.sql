-- Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB.

-- SAK-16668
-- If you upgraded to 2.6.0 PRIOR TO September 1st 2009, you will need to run the conversions in the comments. It converts some additional assignment columns to clob.
 
-- asn_note_item_t note column needs to be clob but is probably varchar
-- asn_ma_item_t text column needs to be clob but is probably varchar
 
/*
 alter table asn_note_item_t add note_clob clob;
 update asn_note_item_t set note_clob = note;
 alter table asn_note_item_t drop column note;
 alter table asn_note_item_t rename column note_clob to note;
*/
 
/*
 alter table asn_ma_item_t add text_clob clob;
 update asn_ma_item_t set text_clob = text;
 alter table asn_ma_item_t drop column text;
 alter table asn_ma_item_t rename column text_clob to text;
*/

-- Note after performing a conversion to clob your indexes may be in an invalid/unusable state. 
-- You will need to run ths following statement, and manually execute the generated 'alter indexes' and re-gather statistics on this table.
-- There are randomly named indexes so it can not be automated.

-- select 'alter index '||index_name||' rebuild online;' from user_indexes where status = 'INVALID' or status = 'UNUSABLE'; 

-- After the field(s) are clobs continue with the updates
