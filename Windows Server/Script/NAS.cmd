@echo off

:: ##################################################################
:: # Présentation: Script pour réaliser un serveur NAS sous Windows #
:: ##################################################################

title "Script de creation NAS"

:: ##################################################################

:: Licence Windows
SET KEY_MIGRATION=
SET KEY_ACTIVATION=
SET UPGRADE=ServerStandard

:: ##################################################################

:: Définir le disque cible
SET DISQUE_D=D
SET DISQUE_E=E
SET DISQUE_F=F

:: ##################################################################

:: Arborescence des dossiers
SET DOSSIER1=Documents
SET DOSSIER2=Images
SET DOSSIER3=Musique
SET DOSSIER4=Videos
SET DOSSIER5=Logiciels
SET DOSSIER6=Sauvegardes
SET DOSSIER7=Depannage
SET DOSSIER8=Virtual-Machines
SET DOSSIER9=Partages

:: Dossier commun au partage
SET PUBLIC=Public

:: ##################################################################

:: Comptes Administrateurs
SET IUS1=IUSR
SET IIS2=IIS_IUSRS

:: Compte Utilisateurs 
SET ADMIN=SAdmin74
SET USER1=Phil74
SET USER2=Isa74
SET USER3=Marc74

SET PASSWORD=admin

:: ##################################################################

SET GRP_1=FTP_USER
SET GRP_2=FTP_ADMIN

:: ##################################################################


:: Menu
:MENU

cls

ECHO.
ECHO ...............................................
ECHO Script pour la creation du NAS par MARC
ECHO ...............................................
ECHO.


echo Menu M: Migrer Windows Server 2016 Evaluation vers Standard

ECHO Menu A: Activation de Windows Server 2016

ECHO Menu 0: Aucune action

ECHO Menu 1: Creation des dossiers DATA (users)

ECHO Menu 2: Creation des Utilisateurs et Groupes

ECHO Menu 3: Insertions des utilisateurs dans les groupes

ECHO Menu 4: Utilisateur Sadmin74 a les droits sur les dossiers Utilisateurs

ECHO Menu 5: Modification permission NTFS pour les utilisateurs (Groupe, Utilisateurs, Dossier)

ECHO Menu 6: Creations des partages Windows

ECHO Menu 7: Inactif

ECHO Menu 8: Inactif

ECHO Menu 9: Inactif

ECHO Menu D: Autodestruction des donnes (Securite ON*)

ECHO Menu P: Purge des Utilisateurs, Groupes et Partages  (Securite ON*)

ECHO Menu q: Quitter


ECHO.


SET /P M=Taper la commande de votre choix :  


:: Migration système et Activation
IF %M%==M GOTO Action_M
IF %M%==A GOTO Action_A

:: Menu pour creation NAS
IF %M%==0 GOTO Action_0
IF %M%==1 GOTO Action_1
IF %M%==2 GOTO Action_2
IF %M%==3 GOTO Action_3
IF %M%==4 GOTO Action_4
IF %M%==5 GOTO Action_5
IF %M%==6 GOTO Action_6
IF %M%==7 GOTO Action_7
IF %M%==8 GOTO Action_8
IF %M%==9 GOTO Action_9

IF %M%==P GOTO Action_p
IF %M%==D GOTO Action_D

IF %M%==q GOTO EOF




:Action_M
cls
dism /online /set-edition:%UPGRADE% /productKey:%KEY_MIGRATION% /accepteula
pause
GOTO MENU


:Action_A
cls
slmgr /ipk %KEY_ACTIVATION%
slmgr /ato
pause
GOTO MENU

:: ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:Action_0
GOTO MENU



:Action_1
cls
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER1%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER2%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER3%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER4%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER5%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER6%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER7%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER8%
mkdir %DISQUE_D%:\LocalUser\%ADMIN%\%DOSSIER9%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER1%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER2%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER3%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER4%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER5%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER6%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER7%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER8%
mkdir %DISQUE_D%:\LocalUser\%USER1%\%DOSSIER9%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER1%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER2%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER3%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER4%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER5%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER6%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER7%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER8%
mkdir %DISQUE_D%:\LocalUser\%USER2%\%DOSSIER9%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER1%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER2%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER3%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER4%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER5%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER6%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER7%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER8%
mkdir %DISQUE_D%:\LocalUser\%USER3%\%DOSSIER9%
mkdir %DISQUE_D%:\LocalUser\%PUBLIC%
pause
GOTO MENU


:Action_2
cls
net localgroup %GRP_1% /add /comment:"Utilisateurs FTP"
net localgroup %GRP_2% /add /comment:"Administrateurs FTP"
net user %USER1% %PASSWORD% /add /fullname:"Philippe" /comment:"Utilisateur de Philippe" /homedir:"D:\LocalUser\Phil74" /active:yes /expires:never /passwordchg:no /logonpasswordchg:no
net user %USER2% %PASSWORD% /add /fullname:"Isabelle" /comment:"Utilisateur de Isabelle" /homedir:"D:\LocalUser\Isa74" /active:yes /expires:never /passwordchg:no /logonpasswordchg:no
net user %USER3% %PASSWORD% /add /fullname:"Marc" /comment:"Utilisateur de Marc" /homedir:"D:\LocalUser\Marc74" /active:yes /expires:never /passwordchg:no /logonpasswordchg:no
net user %ADMIN% %PASSWORD% /add /fullname:"SAdmin74" /comment:"Administrateur" /homedir:"D:\LocalUser\SAdmin74" /active:yes /expires:never /passwordchg:no /logonpasswordchg:no
pause
GOTO MENU


:Action_3
cls
net localgroup Administrateurs %ADMIN% /add
net localgroup %GRP_1% %USER1% /add
net localgroup %GRP_1% %USER2% /add
net localgroup %GRP_1% %USER3% /add
net localgroup %GRP_2% %ADMIN% /add
pause
GOTO MENU


:Action_4
cls
iCACLS "%DISQUE_D%:\LocalUser" /Grant "%ADMIN%":(OI)(CI)F /C /Q
pause
GOTO MENU


:Action_5
cls
iCACLS "%DISQUE_D%:\LocalUser\%USER1%" /Grant "%USER1%":(OI)(CI)(Ci)F /C /Q
iCACLS "%DISQUE_D%:\LocalUser\%USER2%" /Grant "%USER2%":(OI)(CI)(Ci)F /C /Q
iCACLS "%DISQUE_D%:\LocalUser\%USER3%" /Grant "%USER3%":(OI)(CI)(Ci)F /C /Q
pause
GOTO MENU


:Action_6
cls
NET SHARE %USER1%=%DISQUE_D%:\LocalUser\%USER1% /REMARK:"Dossier de l'utilisateur Phil74" /GRANT:%USER1%,FULL
NET SHARE %USER2%=%DISQUE_D%:\LocalUser\%USER2% /REMARK:"Dossier de l'utilisateur Isa74" /GRANT:%USER2%,FULL
NET SHARE %USER3%=%DISQUE_D%:\LocalUser\%USER3% /REMARK:"Dossier de l'utilisateur Marc74" /GRANT:%USER3%,FULL
NET SHARE %ADMIN%$=%DISQUE_D%:\LocalUser\%ADMIN% /REMARK:"Dossier de l'utilisateur Admin74" /GRANT:%ADMIN%,FULL
NET SHARE Public="D:\LocalUser\Public" /REMARK:"Dossier Public" /grant:"Tout le monde",FULL
pause
GOTO MENU


:Action_7
cls
GOTO MENU


:Action_8
cls
GOTO MENU


:Action_9
cls
GOTO MENU

:: ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


:Action_P
cls
exit
NET user %USER1% /delete
NET user %USER2% /delete
NET user %USER3% /delete
NET user %ADMIN% /delete

NET localgroup %GRP_1% /delete
NET localgroup %GRP_2% /delete

NET SHARE %USER1% /delete /yes
NET SHARE %USER2% /delete /yes
NET SHARE %USER3% /delete /yes
NET SHARE %ADMIN%$ /delete /yes
NET SHARE Public /delete /yes
pause
GOTO MENU

:Action_D
cls
exit
rmdir %DISQUE_D%:\LocalUser /s /q
pause
GOTO MENU

:: ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:: Indispensable a la fin : IF %M%==q GOTO EOF

:: *: J'ai mis dans la fonction Action_P et Action_D un exit par précaution. 


:: IIS: 
:: - C:\inetpub\ftproot\JAFFRE\ (Selectionner ce dossier pour la création)
:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Phil74\D
:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Phil74\E
:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Phil74\F
:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Phil74\G

:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Isa74\D
:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Marc74\D

:: 	-- C:\inetpub\ftproot\JAFFRE\LocalUser\Sadmin74\
::  -- Crée des liens virtuels dans le dossier de la lettre de l'user (Marc\D) 


:: Utilisateurs
:: 	- ADMIN : Sadmin74 (groupe: FTP_ADMIN, Administrateurs)
:: 	- USER1 : Phil74   (groupe: FTP_Users)
:: 	- USER2 : Isa74    (groupe: FTP_Users)
:: 	- USER3 : Marc74   (groupe: FTP_Users)
::  - Invités          (Groupe: FTP_Invite)


:: Groupes
:: - FTP_ADMIN         ISS: Lecture & Ecriture
:: - FTP_USER          ISS: Lecture
:: - FTP_Invite        ISS: Lecture


:: Permission des dossiers
:: - Sadmin74     Lecture & Ecriture : Sadmin74
:: - Phil74       Lecture & Ecriture : Sadmin74, Phil74
:: - Isa74        Lecture & Ecriture : Sadmin74, Isa74
:: - Marc74       Lecture & Ecriture : Sadmin74, Marc74




:: FTP (C:\USER)
:: 	- Racine      Tous les utilisateurs = Lecture (Permet l'accès à la racine)	

:: 	- \Admin74    Lecture & Ecriture : FTP_ADMIN 
:: 	- \Phil74			Lecture & Ecriture : FTP_ADMIN, Phil74
:: 	- \Isa74			Lecture & Ecriture : FTP_ADMIN, Isa74 
:: 	- \Marc74			Lecture & Ecriture : FTP_ADMIN, Marc74
:: 	
:: 	- \Public			Lecture & Ecriture : FTP_User, FTP_ADMIN
