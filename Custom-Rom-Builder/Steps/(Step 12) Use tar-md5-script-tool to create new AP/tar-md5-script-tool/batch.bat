@echo ---------------mkh.mourad batch script
set fileName=%1

rem Setup ENV
SETLOCAL ENABLEDELAYEDEXPANSION

cd ..
rem // Delete Previous Folder of same file
RMDIR /S /Q NewAPs\%fileName%
call set curentDir="%cd%%"
MKDIR NewAPs
cd NewAPs
MKDIR %fileName%
cd %fileName%
MKDIR temp-folder
cd ..
cd ..
cd tar-md5-script-tool
FOR /f "delims=" %%G in ('DIR /S /A:-D /B  *.lz4') do (
	call cd %%~dpG
	call !curentDir!\tar-md5-script-tool\BIN\tar --create --format=gnu -b20 --quoting-style=escape --owner=0 --group=0 --totals --mode=644  -f %%~nG.tar %%~nxG
        xcopy %%~nxG  !curentDir!\NewAPs\%fileName%\temp-folder\
	)
cd !curentDir!	


rem Build the TAR File
cd NewAPs
cd %fileName%
cd temp-folder
call !curentDir!\tar-md5-script-tool\BIN\ls *.lz4 > temp-file.txt
call !curentDir!\tar-md5-script-tool\BIN\tar --create --format=gnu -b20 --quoting-style=escape --owner=0 --group=0 --totals --mode=644  -f AP_TAR_MD5_CUSTOM_FILE_ODIN.tar -T temp-file.txt
del /Q temp-file.txt
cd !curentDir!	


rem Create the MD5 Final File:
cd NewAPs
cd %fileName%
FOR /f "delims="  %%G in ('DIR /S /A:-D /B  *.tar') do (
	call cd %%~dpG
	call !curentDir!\tar-md5-script-tool\BIN\md5sum -t %%~nxG >> %%~nxG
        call !curentDir!\tar-md5-script-tool\BIN\mv %%~nxG %%~nxG.md5
	)
cd !curentDir!

rem Cleaning Files
FOR /f "delims=" %%G in ('DIR /S /A:-D /B *.lz4 *.md5 ^| FINDSTR /v /i "\AP_TAR_MD5_CUSTOM_FILE_ODIN.tar.md5$"') do del /Q "%%G"

