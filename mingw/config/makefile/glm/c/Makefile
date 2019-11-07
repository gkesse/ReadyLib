GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GINCLUDE = include
GTARGET_LIB_STATIC = $(GLIB)/libcgml.a
GTARGET_LIB_SHARED = 
    
GINCS = \
    -I$(GSRC)/include \

GLIBS = \
    
GOBJS_LIB_STATIC = \
    $(patsubst $(GSRC)/src/%.c, $(GBUILD)/%.o, $(wildcard $(GSRC)/src/*.c)) \

GCFLAGS = \
    -Wall \
    -std=c11 \
    
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
	@echo R | xcopy /q /y /s $(GSRC)\include $(GINCLUDE)
$(GBUILD)/%.o: $(GSRC)/src/%.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc $(GCFLAGS) -c $< -o $@ $(GINCS)
clean:
	del /q $(GBUILD)\*.o $(GLIB)\*.a
