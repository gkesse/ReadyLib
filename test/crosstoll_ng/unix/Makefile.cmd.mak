#================================================
SHELL: /bin/bash  
#================================================	
GSRC = $(GPROJECT_SRC)
GBIN = bin
GBUILD = build
GTARGET = $(GBIN)/rdc

GINCS = \
    
GLIBS = \

GOBJS = \
    $(patsubst $(GSRC)/%.c, $(GBUILD)/%.o, $(wildcard $(GSRC)/*.c)) \

GCFLAGS = \

#================================================
# crosstool_ng
all: clean_exe compile check
 
compile: $(GOBJS)
	@if ! [ -d $(GBIN) ] ; then mkdir -p $(GBIN) ; fi
	$(GCOMPILER_GCC) -o $(GTARGET) $(GOBJS) $(GLIBS) 
$(GBUILD)/%.o: $(GSRC)/%.c
	@if ! [ -d $(GBUILD) ] ; then mkdir -p $(GBUILD) ; fi
	$(GCOMPILER_GCC) $(GCFLAGS) -c $< -o $@ $(GINCS)
check:
	@echo
	file $(GTARGET)
	@echo
run:
	@echo
	$(GTARGET) $(argv)
	@echo
clean_exe:
	@if ! [ -d $(GBIN) ] ; then mkdir -p $(GBIN) ; fi
	rm -f $(GBIN)/*
clean:
	@if ! [ -d $(GBIN) ] ; then mkdir -p $(GBIN) ; fi
	@if ! [ -d $(GBUILD) ] ; then mkdir -p $(GBUILD) ; fi
	rm -f $(GBUILD)/* $(GBIN)/*
#================================================	
# git
git_push:
	@cd $(GPROJECT_PATH) && git pull && git add --all && git commit -m "Initial Commit" && sudo git push -u origin master
git_push_o:
	@cd $(GPROJECT_PATH) && git add --all && git commit -m "Initial Commit" && sudo git push -u origin master
git_push_s:
	@cd $(GPROJECT_PATH) && sudo git push -u origin master
git_clone:
	@cd $(GPROJECT_ROOT) && git clone $(GGIT_URL) $(GGIT_NAME) 
git_status:
	@git status
git_config:
	@git config --global user.name "$(GGIT_USER)"
	@git config --global user.email "$(GGIT_EMAIL)"
	@git config --global core.editor "$(GGIT_EDITOR)"
	@git config --list
git_store:
	@git config --global credential.helper store
#================================================	
