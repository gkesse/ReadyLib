GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GINCLUDE = include
GTARGET_LIB = $(GLIB)/libGSemaphore.a
    
GOBJS_LIB = \
    $(GBUILD)/semaphore.o
    
all: lib inc
	
exe: $(GOBJS_EXE)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -o $(GTARGET_EXE) $(GOBJS_EXE)
lib: $(GOBJS_LIB)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB) $(GOBJS_LIB)
inc:
	@if not exist "$(GINCLUDE)" @mkdir $(GINCLUDE)
	@xcopy /q /y $(GLIB_SOURCE_DIR)\semaphore.h $(GINCLUDE)
$(GBUILD)/semaphore.o: $(GSRC)/semaphore.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc -c $(GSRC)/semaphore.c -o $(GBUILD)/semaphore.o
clean:
	del /q $(GBUILD)\*.o $(GLIB)\*.a
