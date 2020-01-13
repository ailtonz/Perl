@echo off

rem cd C:\Users\Ailton\Desktop\eMails
echo %1
echo %2


set subject=-subject %1
set body=-body %2

set email="ailtonzsilva@gmail.com"
set server=-server "smtp.f4computer.com"
set user=-u "ailton@f4computer.com"
set password=-pw "wawiwl"

set log=-log blat.log
blat.exe -to %email% -p profile %subject% %body% %server% %user% %password% %log%