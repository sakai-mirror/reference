--Additional information and conversion scripts for the Sakai 2.6.x maintenance branch can be found on Confluence at http://confluence.sakaiproject.org//x/NAIAB.

--SAK-16548 - Incorrect internationalization showing the grade NO GRADE

-- Note these are all mostly hex replacements as I could not find a better way to do it in mysql like in oracle.
--assignment_zh_CN.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22E697A0E8AF84E5888622',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_ar.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22D984D8A720D8AAD988D8ACD8AF20D8A3D98A20D8AFD8B1D8ACD8A92E22',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_pt_BR.properties
update assignment_submission set xml = unhex(replace(hex(xml),'224E656E68756D61204176616C6961C3A7C3A36F22',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_es.properties 
update assignment_submission set xml = replace(xml,'"No hay calificación"','"gen.nograd"') where xml like '%graded="true"%';    
--assignment_ko.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22ED9599ECA09020EC9786EC9D8C22',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_eu.propertie
update assignment_submission set xml = replace(xml,'"Kalifikatu gabe"','"gen.nograd"') where xml like '%graded="true"%';    
--assignment_nl.properties
update assignment_submission set xml = replace(xml,'"Zonder beoordeling"','"gen.nograd"') where xml like '%graded="true"%';    
--assignment_fr_CA.properties
update assignment_submission set xml = replace(xml,'"Aucune note"','"gen.nograd"') where xml like '%graded="true"%';    
--assignment_en_GB.properties
update assignment_submission set xml = replace(xml,'"No Mark"','"gen.nograd"') where xml like '%graded="true"%';    
--assignment.properties
update assignment_submission set xml = replace(xml,'"No Grade"','"gen.nograd"') where xml like '%graded="true"%';    
--assignment_ca.properties
update assignment_submission set xml = unhex(replace(hex(xml),'224E6F206861792063616C69666963616369C3B36E22',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_pt_PT.properties
update assignment_submission set xml = unhex(replace(hex(xml),'2253656D206176616C6961C3A7C3A36F22',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_ru.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22D091D0B5D0B720D0BED186D0B5D0BDD0BAD0B822',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_sv.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22426574796773C3A474747320656A22',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_ja.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22E68EA1E782B9E38197E381AAE3818422',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
--assignment_zh_TW.properties
update assignment_submission set xml = unhex(replace(hex(xml),'22E6B292E69C89E8A995E5888622',hex('"gen.nograd"'))) where xml like '%graded="true"%';    
