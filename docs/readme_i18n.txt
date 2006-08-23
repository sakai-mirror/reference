==========================
Sakai Internationalization
==========================

All of the legacy Sakai tools and many of the JSF based tools have been
localized and internationalized. Translations are underway in many
languages, as follows:

1) Chinese (China)
   Status: completed for 2.2 (partially done in 2.1)
   Translated by: Tianhua Ding, Kun Lv (and others)
   Contact: Beth Kirschner    beth.kirschner@umich.edu
   Local ID: zh_CN
   
2) Korean
   Status: Completed for Sakai 2.0.1 (Legacy tools only)
   Translated by: Il-hwan Kim
   Contact: Beth Kirschner    beth.kirschner@umich.edu
   Local ID: ko_KR
   
3) Japanese
   Status: completed for 2.2 (partially done in 2.1)
   Translated by: Tatsuki Sugura (and others)
   Contact: Shoji Kajita   kajita@nagoya-u.jp
   Local ID: ja_JP
   
4) Dutch
   Status: Completed for Sakai 2.1
   Translated by: n/a
   Contact: Jim Doherty   jim.doherty@gmail.com 
   Local ID: nl_NL
   
5) Danish
   Status: in progress
   Translated by: n/a
   Contact: Kasper Pagels   kasper@pagels.dk
   Local ID: da_DK
   
6) Hebrew 
   Status: ??
   Translated by: n/a
   Contact: Dov Winer      admin@makash.org.il
   Local ID: iw_IL

7) Brazilian Portugese 
   Status: ??
   Translated by: n/a
   Contact: Alceu Fernandes Filho   alceu@unisinos.br
   Local ID: pt_BR
   
8) Portugese
   Status: ??
   Translated by: n/a
   Contact:  Feliz Gouveia    fribeiro@ufp.pt
   Local ID: pt_PT
   
9) Slovakian
   Status: ??
   Translated by: n/a
   Contact: Michal Mosovic   salmon@salmon.sk
   Local ID: sk_SK
    
10) Catalan
    Status: Partially completed for 2.2
    Translated by: n/a
    Contact: Alex Ballest�   alex@asic.udl.es
    Local ID: ca_ES
    
11) Chinese (Taiwan)
    Status: ??
    Translated by: Max Tsai
    Contact: Max Tsai  mj_tsai@yahoo.com
    Local ID: zh_TW
    
12) French (Canadian)
    Status: to be released in 2.2
    Translated by: n/a
    Contact Mustapha Es-salihe (Mustapha.Es-salihe@crim.ca)
    Local ID: fr_CA
	 
13) Spanish (Spain)
    Status: completed for 2.2 (partially done in 2.1.2)
    Translated by: David Rold�n Mart�nez, Diego del Blanco, Ra�l Mengod
    Contact: Federico Jes�s Carvajal Rodrigo (fcarvajal@abierta.upv.es)
    Local ID: es_ES

14) Spanish (Mexico)
    Status: Relying on translation from es_ES locale
    Translated by: n/a
    Contact: Cynthia Gonzalez (gonzalez.cynthia@itesm.mx)
    Contact: Larisa Enriquez Vazquez (larisa@piaget.dgsca.unam.mx)
    Local ID: es_MX

15) Spanish (Argentina)
    Status: ??
    Translated by: n/a
    Contact: Sebasti�n Barreiro (sbarreiro@gmail.com)
    Local ID: es_AR
    
16) Spanish (Chile)
    Status: ??
    Translated by: n/a
    Contact: Alejandro Fuentes de la Hoz (afd@csol.org)
    Local ID: es_CL
    
17) Russian
    Status: ??
    Translated by: n/a
    Contact: Alexander Glebovsky (glebovsky@rambler.ru)
    Local ID: ru_RU

18) German
    Status: ??
    Translated by: n/a
    Contact: Wolf Hilzensauer (wolf.hilzensauer@salzburgresearch.at)
    Local ID: de_AT

18) Swedish
    Status: initial 2.2 translation checked in
    Translated by: n/a
    Contact: Magnus Tagesson (magnus.tagesson@it.su.se)
    Local ID: sv_SE
                
19) Turkish
    Status: inquiry on 7/17/2006
    Translated by: n/a
    Contact: E. Emre �zkeskin (eozkeskin@hotmail.com)
    Local ID: tr_TR
                
The default language locale must be defined at boot time (though this 
can be over-ridden by user preferences), by setting the tomcat 
JAVA_OPTS property as follows:

-- catalina.sh -----------------------------------------------
## Define default language locale: Japanese / Japan
JAVA_OPTS="$JAVA_OPTS -Duser.language=ja -Duser.region=JP"
--------------------------------------------------------------

-- catalina.bat ----------------------------------------------
rem Define default language locale: Japanese / Japan
set JAVA_OPTS=%JAVA_OPTS% -Duser.language=ja -Duser.region=JP
--------------------------------------------------------------
