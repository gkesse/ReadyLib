GSRC = $(GLIB_SOURCE_DIR)
GBIN = bin
GLIB = lib
GBUILD = build
GTARGET_EXE = $(GBIN)/sqlite3.exe
GTARGET_LIB = $(GLIB)/libsqlite3.a

GOBJS_EXE = \
    $(GBUILD)/shell.o \
    $(GBUILD)/sqlite3.o
    
GOBJS_LIB = \
    $(GBUILD)/sqlite3.o
    
all: exe lib
	
exe: $(GOBJS_EXE)
	@if not exist "$(GBIN)" @mkdir $(GBIN)
	gcc -o $(GTARGET_EXE) $(GOBJS_EXE)
lib: $(GOBJS_LIB)
	@if not exist "$(GLIB)" @mkdir $(GLIB)
	ar rcs $(GTARGET_LIB) $(GOBJS_LIB)
$(GBUILD)/shell.o: $(GSRC)/shell.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc -c $(GSRC)/shell.c -o $(GBUILD)/shell.o
$(GBUILD)/sqlite3.o: $(GSRC)/sqlite3.c
	@if not exist "$(GBUILD)" @mkdir $(GBUILD)
	gcc -c $(GSRC)/sqlite3.c -o $(GBUILD)/sqlite3.o
clean:
	del /q $(GBUILD)\*.o $(GBIN)\*.exe $(GBIN)\*.a
