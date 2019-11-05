GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GINCLUDE = include
GTARGET_LIB_STATIC = $(GLIB)/libSOIL.a
GTARGET_LIB_SHARED = 
    
GINCS = \
    -I$(GSRC)\src \

GLIBS = \
    
GOBJS_LIB_STATIC = \
    $(GBUILD)/image_helper.o \
    $(GBUILD)/stb_image_aug.o  \
    $(GBUILD)/image_DXT.o \
    $(GBUILD)/SOIL.o \
    
all: lib_static inc
	
exe: $(GOBJS_EXE)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -o $(GTARGET_EXE) $(GOBJS_EXE)
lib_shared: $(GOBJS_LIB_SHARED)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -shared -o $(GTARGET_LIB_SHARED) $(GOBJS_LIB_SHARED) $(GLIBS)
lib_static: $(GOBJS_LIB_STATIC)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB_STATIC) $(GOBJS_LIB_STATIC)
inc:
	@if not exist "$(GINCLUDE)" @mkdir $(GINCLUDE)
	@echo F | xcopy $(GLIB_SOURCE_DIR)\src\*.h $(GINCLUDE)
$(GBUILD)/image_helper.o: $(GSRC)/src/image_helper.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS) -c $(GSRC)/src/image_helper.c -o $(GBUILD)/image_helper.o $(GINCS)
$(GBUILD)/stb_image_aug.o: $(GSRC)/src/stb_image_aug.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS) -c $(GSRC)/src/stb_image_aug.c -o $(GBUILD)/stb_image_aug.o $(GINCS)
$(GBUILD)/image_DXT.o: $(GSRC)/src/image_DXT.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS) -c $(GSRC)/src/image_DXT.c -o $(GBUILD)/image_DXT.o $(GINCS)
$(GBUILD)/SOIL.o: $(GSRC)/src/SOIL.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS) -c $(GSRC)/src/SOIL.c -o $(GBUILD)/SOIL.o $(GINCS)
clean:
	del /q $(GBUILD)\*.o $(GLIB)\*.a
