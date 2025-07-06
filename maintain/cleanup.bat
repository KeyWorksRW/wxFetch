@echo off

@echo This script is used to clean up the wxWidgets repository
@echo for use with CMake's FetchContent_Declare command.
@echo.
@echo It can take a while to run, so please be patient...

@REM This repository is designed to be used with CMake's FetchContent_Declare command. This script
@REM cleans up the repository by removing files and directories that are not needed by CMake to build
@REM the various wxWidgets libraries.

@REM Remove unused directories

if not exist "maintain" (
    cd ..
)

if exist ".\3rdparty\catch" rd /s /q ".\3rdparty\catch"
if exist ".\demos" rd /s /q ".\demos"
if exist ".\distrib" rd /s /q ".\distrib"
if exist ".\interface" rd /s /q ".\interface"
if exist ".\lib" rd /s /q ".\libwh *"
if exist ".\locale" rd /s /q ".\locale"
if exist ".\misc" rd /s /q ".\misc"
if exist ".\samples" rd /s /q ".\samples"
if exist ".\src\png\ci" rd /s /q ".\src\png\ci"
if exist ".\utils\helpview" rd /s /q ".\utils\helpview"
if exist ".\utils\hhp2cached" rd /s /q ".\utils\hhp2cached"
if exist ".\utils\ifacecheck" rd /s /q ".\utils\ifacecheck"
if exist ".\utils\screenshotgen" rd /s /q ".\utils\screenshotgen"

@REM Wildcards are not used to avoid the risk of deleting unintended directories.

@echo Removing unused directories...

for /d /r %%d in (android) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (bin) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (doc) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (docs) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (examples) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (iphone) do if exist "%%d" rd /s /q "%%d"

@echo Halfway through removing directories...

for /d /r %%d in (qt) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (man) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (m4) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (scripts) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (test) do if exist "%%d" rd /s /q "%%d"
for /d /r %%d in (tests) do if exist "%%d" rd /s /q "%%d"

@REM Remove unused files

@echo Removing unused files...

if exist ".\.git-blame-ignore-revs" del ".\.git-blame-ignore-revs"
if exist ".\Makefile.in" del ".\Makefile.in"
if exist ".\mkinstalldirs" del ".\mkinstalldirs"
if exist ".\regen" del ".\regen"
if exist ".\README-GIT.md" del ".\README-GIT.md"

for /r %%f in (Makefile.in) do del /q "%%f" >nul 2>&1

@REM This bakefile is required for the build system, so save it and delete the rest.
if exist "build\bakefiles\version.bkl" ren "build\bakefiles\version.bkl" "version.bkl.save" >nul 2>&1
for /r %%f in (*.bkl) do del /q "%%f"
if exist "build\bakefiles\version.bkl.save" ren "build\bakefiles\version.bkl.save" "version.bkl" >nul 2>&1

for /r %%f in (*.gcc) do del /q "%%f"
for /r %%f in (*.m4) do del /q "%%f"
for /r %%f in (*.mk) do del /q "%%f"
for /r %%f in (*.mms) do del /q "%%f"
for /r %%f in (*.mms) do del /q "%%f"
for /r %%f in (*.pl) do del /q "%%f"
for /r %%f in (*.py) do del /q "%%f"
for /r %%f in (*.sh) do del /q "%%f"
for /r %%f in (*.sln) do del /q "%%f"
for /r %%f in (*.yaml) do del /q "%%f"
for /r %%f in (*.yml) do del /q "%%f"

@REM This repository is designed to be pulled in as a dependecy, so there is no use for Visual Studio files.

for /r %%f in (*.vc*) do del /q "%%f"

@REM Use our own README.md file which explains the purpose of this repositry, and
@REM links to a copy of the wxWidgets readme file (maintain/wxREADME.md).
copy /y "maintain\README.md" "." >nul
