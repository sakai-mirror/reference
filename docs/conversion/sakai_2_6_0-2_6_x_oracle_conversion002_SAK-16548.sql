-- Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB.

-- SAK-16548 - Incorrect internationalization showing the grade NO GRADE
-- NOTE: It is possible that your xml column in assignment_submission may be a long type. You need to convert it to a clob if this is the case.
--       The following SQL will fail to run if the column is a long.

--       This seems to be either clob or long (It needs to be a clob)

-- alter table assignment_submission modify xml clob;

-- Note after performing a conversion to clob your indexes may be in an invalid/unusable state. 
-- You will need to run ths following statement, and manually execute the generated 'alter indexes' and re-gather statistics on this table.
-- There are randomly named indexes so it can not be automated.

-- select 'alter index '||index_name||' rebuild online;' from user_indexes where status = 'INVALID' or status = 'UNUSABLE'; 

-- After the field(s) are clobs continue with the updates

-- Values pulled from gen.nograd in ./assignment-bundles/assignment_*.properties

-- ******* Information about SAK-16548 conversion. *******

-- This conversion is broken up into 3 parts for performance reasons. The first part does a create table based on a select, it filters out results it needs to change.
-- In production at Michigan this took ~7 hours to filter through 2 million submissions and created a table with 20000 rows (1% of the table). The original script planned
-- for 2.6.1 took days to complete and did full table locks. 

-- The second part performs updates based on the results from the filter. In our case the update only took around 5 minutes, much less than the filter. 

-- You can run both of these parts while your system is up, you don't need to have an extended downtime.   

--Step 1: Create a temporary table using a subselect to just get the ids that need updating
create table assignment_submission_id_temp as
    select submission_id from assignment_submission where graded = 'true' and (
--assignment_zh_CN.properties
        instr(xml,unistr('"\65E0\8BC4\5206"')) !=0 or 
--assignment_ar.properties
        instr(xml,unistr('"\0644\0627 \062A\0648\062C\062F \0623\064A \062F\0631\062C\0629."')) !=0 or 
--assignment_pt_BR.properties
        instr(xml,unistr('"Nenhuma Avalia\00e7\00e3o"')) !=0 or 
--assignment_es.properties 
        instr(xml,unistr('"No hay calificaci\00F3n"')) !=0 or 
--assignment_ko.properties
        instr(xml,unistr('"\d559\c810 \c5c6\c74c"')) !=0 or 
--assignment_eu.propertie
        instr(xml,unistr('"Kalifikatu gabe"')) !=0 or 
--assignment_nl.properties
        instr(xml,unistr('"Zonder beoordeling"')) !=0 or 
--assignment_fr_CA.properties
        instr(xml,unistr('"Aucune note"')) !=0 or 
--assignment_en_GB.properties
        instr(xml,unistr('"No Mark"')) !=0 or 
--assignment.properties
        instr(xml,unistr('"No Grade"')) !=0 or 
--assignment_ca.properties
        instr(xml,unistr('"No hi ha qualificaci\00f3"')) !=0 or 
--assignment_pt_PT.properties
        instr(xml,unistr('"Sem avalia\00E7\00E3o"')) !=0 or 
--assignment_ru.properties
        instr(xml,unistr('"\0411\0435\0437 \043e\0446\0435\043d\043a\0438"')) !=0 or 
--assignment_sv.properties
        instr(xml,unistr('"Betygs\00E4tts ej"')) !=0 or 
--assignment_ja.properties
        instr(xml,unistr('"\63a1\70b9\3057\306a\3044"')) !=0 or 
--assignment_zh_TW.properties
        instr(xml,unistr('"\6c92\6709\8a55\5206"')) !=0  
);

--Step 2:Run the update from this temporary table
update assignment_submission set xml = regexp_replace(xml, 'scaled_grade=".*?"', 'scaled_grade="gen.nograd"') where submission_id in (
    select submission_id from assignment_submission_id_temp);

--Step 3: Drop the temp table
drop table assignment_submission_id_temp; 

-- END OF SAK-16548
