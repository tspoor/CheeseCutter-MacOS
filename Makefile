LIBS=/usr/local/lib/libphobos2-ldc.a /usr/local/lib/libdruntime-ldc.a -lc++ 
COMFLAGS= -mmacosx-version-min=10.14
VERSION=$(shell cat Version)
DLINK=$(COMFLAGS)
DFLAGS=-I./src -J./src/c64 -J./src/font
CFLAGS=$(COMFLAGS)
#CXXFLAGS=$(CFLAGS) -I./src -O2 -stdlib=libc++
CXXFLAGS=$(CFLAGS) -I./src -stdlib=libc++
LDFLAGS=-rpath,@executable_path/../Frameworks
#COMPILE.d = $(DC) $(DFLAGS) -wi -g -d -O2 -c -of=$@
COMPILE.d = $(DC) $(DFLAGS) -wi -g -d -c -of=$@
DC=ldc2
EXE=
TARGET=ccutter
OBJ_EXT=.o

include Makefile.objects.mk

$(TARGET): $(C64OBJS) $(OBJS) $(CXX_OBJS)
	$(CC) $(DLINK) -Wl,$(LDFLAGS) -o $(TARGET) $(OBJS) $(CXX_OBJS) $(LIBS) 

.cpp.o : $(CXX_SRCS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.c.o : $(C_SRCS)
	$(CC) -c $< -o $@

ct: $(C64OBJS) $(CTOBJS)

ct2util: $(C64OBJS) $(UTILOBJS)
	$(CC) $(DLINK) -o $@ $(UTILOBJS) $(LIBS)

c64: $(C64OBJS)

all: c64 $(OBJS) $(CXX_OBJS) ct2util ct $(TARGET)

release: all
	strip ccutter$(EXE)
	strip ct2util$(EXE)

	rm -rf CheeseCutter.app
	mkdir -p CheeseCutter.app/Contents/Frameworks
	mkdir -p CheeseCutter.app/Contents/MacOS
	cp -r arch/MacOS/Contents CheeseCutter.app
	cp -r /Library/Frameworks/SDL.framework CheeseCutter.app/Contents/Frameworks
	cp $(TARGET) CheeseCutter.app/Contents/MacOS
	cp ct2util CheeseCutter.app/Contents/MacOS

dist:	release
	rm -rf dist
	rm -rf CheeseCutter_$(VERSION).dmg
	arch/makedmg.sh

clean: 
	rm -f *.o *~ resid/*.o resid-fp/*.o ccutter ct2util \
		$(C64OBJS) $(OBJS) $(CTOBJS) $(CXX_OBJS) $(UTILOBJS)

dclean: clean
	rm -rf dist
	rm -rf CheeseCutter.app
	rm -rf CheeseCutter_$(VERSION).dmg


tar:
	git archive master --prefix=cheesecutter-$(VERSION)/ | bzip2 > cheesecutter-$(VERSION)-macosx-src.tar.bz2
# --------------------------------------------------------------------------------

src/c64/player.bin: src/c64/player_v4.acme
	acme -f cbm --outfile $@ $<

src/ct/base.o: src/c64/player.bin
src/ui/ui.o: src/ui/help.o

%.o: %.d
	$(COMPILE.d) $<



