@echo off

set JAVA_OPTS=-server -Xmx1024m -XX:MaxNewSize=256m -XX:MaxPermSize=256m -Dhttp.agent=Sakai -Dsakai.demo=true
set CATALINA_OPTS=-server -Xmx1024m -XX:MaxNewSize=256m -XX:MaxPermSize=256m -Dhttp.agent=Sakai -Dsakai.demo=true

set CATALINA_HOME=
set CATALINA_BASE=

bin\startup.bat

