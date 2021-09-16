@echo off

rem to temporarily remove secure connection
gem sources -r https://rubygems.org/

rem add insecure connection
gem sources -a http://rubygems.org/

rem now we're able to update rubygems without SSL
gem update --system

rem after updating rubygems do vice versa
rem to remove insecure connection
gem sources -r http://rubygems.org/

rem add secure connection
gem sources -a https://rubygems.org/

rem Now you're able to update gems using secure connection.
gem update

pause