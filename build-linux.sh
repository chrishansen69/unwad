
# normal build

echo building unwad

cd include/minizip
gcc -c \
-Dunix=1 \
minizip.c miniunz.c zip.c unzip.c ioapi.c
cd ../..

g++ -Wall \
-L./lib
-I./include/pngpp -I./include \
unwad.cpp qmus2mid.cpp \
include/minizip/minizip.o include/minizip/ioapi.o include/minizip/zip.o include/minizip/unzip.o \
-lmagic -lpng -lz \
-o unwad || exit 1

strip unwad

echo building unwad.static

g++ -Wall \
-L./lib
-I./include/pngpp -I./include \
unwad.cpp qmus2mid.cpp \
include/minizip/minizip.o include/minizip/ioapi.o include/minizip/zip.o include/minizip/unzip.o \
lib/libmagic.a lib/libpng.a lib/libz.a \
-o unwad.static || exit 1

strip unwad.static

cd include/minizip
rm *.o
cd ../..
