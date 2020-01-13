@echo off
set nome=""
echo Digite o seu nome:
set /p nome=
if "%nome"=="" goto ops
perl user.pl %nome% 
goto fim
:ops
echo nada foi passado
:fim
echo concluido