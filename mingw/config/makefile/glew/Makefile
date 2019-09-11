GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GINCLUDE = include
GTARGET_LIB_STATIC = $(GLIB)/libglew32.a
GTARGET_LIB_SHARED = $(GBIN)/libglew32.dll.a
    
GINCS = \
    -I$(GSRC)\include \
    
GOBJS_LIB = \
    $(GBUILD)/glew.o \
    
GCFLAGS = \
    -DGLEW_NO_GLU \
    -DGLEW_BUILD \
    -O2 -Wall -W \
    -Wcast-function-type \

all: lib_shared lib_static inc
	
exe: $(GOBJS_EXE)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -o $(GTARGET_EXE) $(GOBJS_EXE)
lib_shared: $(GOBJS_LIB)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB) $(GOBJS_LIB)
lib_static: $(GOBJS_LIB)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB) $(GOBJS_LIB)
inc:
	@if not exist "$(GINCLUDE)" @mkdir $(GINCLUDE)
	@xcopy /q /s /i /y $(GLIB_SOURCE_DIR)\include $(GINCLUDE)
$(GBUILD)/glew.o: $(GSRC)/src/glew.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS) -c $(GSRC)/src/glew.c -o $(GBUILD)/glew.o $(GINCS)
clean:
	del /q $(GBUILD)\*.o $(GLIB)\*.a
