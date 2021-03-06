echo X                                                 X
echo X                                                 X
echo X  Warning: this batch file has not been tested.  X
echo X                                                 X
echo X                                                 X

g++ filechars.cpp -o filechars.exe
if not errorlevel 0 (
	pause
	exit 1
)

filechars readme.txt
del filechars.exe

cd include\minizip
gcc -c -DWIN32=1 -I.\include -I.. minizip.c miniunz.c zip.c unzip.c iowin32.c ioapi.c
if not errorlevel 0 (
	pause
	exit 1
)

cd ..\..

g++ -Wall -DMSW=1 unwad.cpp qmus2mid.cpp -I./include -I./include/pngpp -I./include/minizip -Ldll -lmagic1 -lzlib1 -lregex2 -llibpng13  -o unwad.exe
if not errorlevel 0 (
	pause
	exit 1
)

cd include\minizip
del *.o
cd ..\..

if not exist unwad.exe exit 1
