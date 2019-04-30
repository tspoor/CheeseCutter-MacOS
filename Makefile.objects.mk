OBJS=   src/derelict/util/compat$(OBJ_EXT) \
	    src/derelict/util/sharedlib$(OBJ_EXT) \
	    src/derelict/util/exception$(OBJ_EXT) \
        src/derelict/util/loader$(OBJ_EXT) \
        src/derelict/util/wintypes$(OBJ_EXT) \
        src/derelict/util/xtypes$(OBJ_EXT) \
        src/derelict/sdl2/gpu$(OBJ_EXT) \
        src/derelict/sdl2/mixer$(OBJ_EXT) \
        src/derelict/sdl2/image$(OBJ_EXT) \
        src/derelict/sdl2/sdl$(OBJ_EXT) \
        src/derelict/sdl2/config$(OBJ_EXT) \
        src/derelict/sdl2/net$(OBJ_EXT) \
        src/derelict/sdl2/ttf$(OBJ_EXT) \
        src/derelict/sdl2/internal/gpu_static$(OBJ_EXT) \
        src/derelict/sdl2/internal/gpu_types$(OBJ_EXT) \
        src/derelict/sdl2/internal/sdl_static$(OBJ_EXT) \
        src/derelict/sdl2/internal/sdl_dynamic$(OBJ_EXT) \
        src/derelict/sdl2/internal/gpu_dynload$(OBJ_EXT) \
        src/derelict/sdl2/internal/gpu_dynamic$(OBJ_EXT) \
        src/derelict/sdl2/internal/sdl_dynload$(OBJ_EXT) \
        src/derelict/sdl2/internal/sdl_types$(OBJ_EXT) \
	src/audio/audio$(OBJ_EXT) \
	src/audio/player$(OBJ_EXT) \
	src/audio/timer$(OBJ_EXT) \
	src/audio/callback$(OBJ_EXT) \
	src/ct/purge$(OBJ_EXT) \
	src/ct/base$(OBJ_EXT) \
	src/ct/dump$(OBJ_EXT) \
	src/com/fb$(OBJ_EXT) \
	src/com/cpu$(OBJ_EXT) \
	src/com/kbd$(OBJ_EXT) \
	src/com/session$(OBJ_EXT) \
	src/com/util$(OBJ_EXT) \
	src/main$(OBJ_EXT) \
	src/ui/tables$(OBJ_EXT) \
	src/ui/dialogs$(OBJ_EXT) \
	src/ui/ui$(OBJ_EXT) \
	src/ui/input$(OBJ_EXT) \
	src/ui/help$(OBJ_EXT) \
	src/seq/seqtable$(OBJ_EXT) \
	src/seq/tracktable$(OBJ_EXT) \
	src/seq/trackmap$(OBJ_EXT) \
	src/seq/fplay$(OBJ_EXT) \
	src/seq/sequencer$(OBJ_EXT) \
	src/audio/resid/filter$(OBJ_EXT)

CXX_SRCS = src/audio/resid/residctrl.cpp \
	src/resid/envelope.cpp \
	src/resid/extfilt.cpp \
	src/resid/filter.cpp \
	src/resid/w6_ps_.cpp \
	src/resid/w6_pst.cpp \
	src/resid/w6_p_t.cpp \
	src/resid/w6__st.cpp \
	src/resid/w8_ps_.cpp \
	src/resid/w8_pst.cpp \
	src/resid/w8_p_t.cpp \
	src/resid/w8__st.cpp \
	src/resid/pot.cpp \
	src/resid/sid.cpp \
	src/resid/voice.cpp \
	src/resid/wave.cpp \
	src/resid-fp/envelopefp.cpp \
	src/resid-fp/extfiltfp.cpp \
	src/resid-fp/filterfp.cpp \
	src/resid-fp/potfp.cpp \
	src/resid-fp/sidfp.cpp \
	src/resid-fp/versionfp.cpp \
	src/resid-fp/voicefp.cpp \
	src/resid-fp/wavefp.cpp 

CXX_OBJS = $(CXX_SRCS:.cpp=$(OBJ_EXT))

C_SRCS	= \
	src/asm/acme.c \
	src/asm/alu.c \
	src/asm/basics.c \
	src/asm/cpu.c \
	src/asm/dynabuf.c \
	src/asm/encoding.c \
	src/asm/flow.c \
	src/asm/global.c \
	src/asm/input.c src/asm/label.c \
	src/asm/macro.c \
	src/asm/mnemo.c \
	src/asm/output.c \
	src/asm/platform.c \
	src/asm/section.c \
	src/asm/tree.c

C_OBJS	= $(C_SRCS:.c=$(OBJ_EXT))

UTILOBJS = src/ct2util$(OBJ_EXT) \
	src/ct/base$(OBJ_EXT) \
	src/com/cpu$(OBJ_EXT) \
	src/com/util$(OBJ_EXT) \
	src/ct/purge$(OBJ_EXT) \
	src/ct/dump$(OBJ_EXT) \
	src/ct/build$(OBJ_EXT) \
	$(C_OBJS)

C64OBJS = src/c64/player.bin

CTOBJS	=

DIST_FILES = \
	./ChangeLog \
	./LICENSE.md \
	./README.md \
	./ccutter$(EXE) \
	./ct2util$(EXE) \
	./tunes/*
