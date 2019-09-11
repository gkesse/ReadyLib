GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GINCLUDE = include
GTARGET_LIB_STATIC = $(GLIB)/libargtable3.a
GTARGET_LIB_SHARED = $(GBIN)/unknown.dll
GTARGET_EXE = $(GBIN)/unknown.exe
    
GINCS = \
    -I. \
    
GOBJS_LIB_STATIC = \
    $(GBUILD)/static-argtable3.o \

GOBJS_LIB_SHARED = \

GOBJS_EXE = \

GCFLAGS_STATIC = \
 
GCFLAGS_SHARED = \

all: clean lib_static inc
	
exe: $(GOBJS_EXE)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -o $(GTARGET_EXE) $(GOBJS_EXE)
lib_static: $(GOBJS_LIB_STATIC)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB_STATIC) $(GOBJS_LIB_STATIC)
lib_shared: $(GOBJS_LIB_SHARED)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -shared -o $(GTARGET_LIB_SHARED) $(GOBJS_LIB_SHARED)
inc:
	@if not exist "$(GINCLUDE)" @mkdir $(GINCLUDE)
	@xcopy /q /y $(GLIB_SOURCE_DIR)\argtable3.h $(GINCLUDE)
$(GBUILD)/static-argtable3.o: $(GSRC)/argtable3.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS_STATIC) -c $(GSRC)/argtable3.c -o $(GBUILD)/static-argtable3.o $(GINCS)
$(GBUILD)/shared-unknown.o: $(GSRC)/unknown.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS_SHARED) -c $(GSRC)/unknown.c -o $(GBUILD)/shared-unknown.o $(GINCS)
clean:
	@if exist "$(GBUILD)" @del /q $(GBUILD)\*.o
	@if exist "$(GLIB)" @del /q $(GLIB)\*.a
	@if exist "$(GBIN)" @del /q $(GBIN)\*.exe $(GBIN)\*.dll
