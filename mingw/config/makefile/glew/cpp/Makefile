GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GINCLUDE = include
GTARGET_LIB_STATIC = $(GLIB)/libglew32.a
GTARGET_LIB_SHARED = $(GBIN)/libglew32.dll.a
    
GINCS = \
    -I$(GSRC)\include \

GLIBS = \
    -lglu32 -lopengl32 -lgdi32 -luser32 -lkernel32 -nostdlib \
    
GOBJS_LIB = \
    $(GBUILD)/glew.o \
    
GCFLAGS = \
    -DGLEW_NO_GLU \
    -DGLEW_BUILD \

all: lib_shared lib_static inc
	
exe: $(GOBJS_EXE)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	g++ -o $(GTARGET_EXE) $(GOBJS_EXE)
lib_shared: $(GOBJS_LIB)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	g++ -shared -o $(GTARGET_LIB_SHARED) $(GOBJS_LIB) $(GLIBS)
lib_static: $(GOBJS_LIB)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB_STATIC) $(GOBJS_LIB)
inc:
	@if not exist "$(GINCLUDE)" @mkdir $(GINCLUDE)
	@xcopy /q /s /i /y $(GLIB_SOURCE_DIR)\include $(GINCLUDE)
$(GBUILD)/glew.o: $(GSRC)/src/glew.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	g++ $(GCFLAGS) -c $(GSRC)/src/glew.c -o $(GBUILD)/glew.o $(GINCS)
clean:
	del /q $(GBUILD)\*.o $(GLIB)\*.a
