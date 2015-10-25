REM Building openssl requires perl
set PATH=C:\Perl\bin;C:\Perl64\bin;%PATH%

REM The first if is separate due to windows batch file quirk
if "%ARCH%"=="32"  set PATH=%LOCALAPPDATA%\nasm;C:\Program Files (x86)\nasm;C:\Program Files\nasm;%PATH%
if "%ARCH%"=="32" (
    set OSSL_CONFIGURE=VC-WIN32
    set OSSL_DO_SCRIPT=ms\do_nasm.bat
) ELSE (
    set OSSL_CONFIGURE=VC-WIN64A
    set OSSL_DO_SCRIPT=ms\do_win64a.bat
)

REM Configure step
perl configure %OSSL_CONFIGURE%
if errorlevel 1 exit 1
call %OSSL_DO_SCRIPT%
if errorlevel 1 exit 1

REM Build step
if "%ARCH%"=="64" (
    ml64 -c -Foms\uptable.obj ms\uptable.asm
    if errorlevel 1 exit 1
)
nmake -f ms\nt.mak
if errorlevel 1 exit 1

REM Install step
copy out32\ssleay32.lib %LIBRARY_LIB%\
copy out32\libeay32.lib %LIBRARY_LIB%\
mkdir %LIBRARY_INC%\openssl
xcopy /S include\openssl\*.* %LIBRARY_INC%\openssl\
