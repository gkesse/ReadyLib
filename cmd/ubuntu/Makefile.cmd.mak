#================================================
SHELL: /bin/bash  
#================================================	
# package
pkg_install:
	sudo apt -y install \
    libncurses5-dev \
    libncursesw5-dev \
    flex \
    bison \
    libssl-dev \
    git \
    gawk \
    texinfo \
    python-docutils \
    python-sphinx \
    automake \
    autoconf \
    help2man \
    libtool \
    libtool-bin \
    gperf \
    bzip2 \
    xz-utils \
    unzip 
#================================================	
# xenomai
xen_all: pkg_install xen_download linux_download xen_patch xen_config

xen_download:
	@if ! [ -d $(GXENOMAI_ROOT) ] ; then mkdir -p $(GXENOMAI_ROOT) ; fi
	@if ! [ -d $(GXENOMAI_NAME) ] ; then cd $(GXENOMAI_ROOT) && wget $(GXENOMAI_URL) ; fi
	@if ! [ -d $(GXENOMAI_NAME) ] ; then cd $(GXENOMAI_ROOT) && tar xjfv $(GXENOMAI_ARCHIVE) ; fi
	@if [ -f $(GXENOMAI_ARCHIVE) ] ; then cd $(GXENOMAI_ROOT) && rm -f $(GXENOMAI_ARCHIVE) ; fi
xen_patch:
	@cd $(GXENOMAI_NAME) && $(GXENOMAI_PREPARE) \
	--linux=$(GLINUX_NAME) \
	--arch=$(GXENOMAI_ARCH) \
	--ipipe=$(GXENOMAI_IPIPE)
xen_config:
	@cd $(GLINUX_NAME) && make menuconfig
xen_cpuinfo:
	@cd $(GLINUX_NAME) && cat /proc/cpuinfo | grep -i family
xen_compile:
	@CONCURRENCY_LEVEL=$(nproc) make-kpkg \
	--rootcmd fakeroot \
	--initrd kernel_image kernel_headers
#================================================	
# crosstool
crosstool_download:
	@if ! [ -d $(GCROSSTOOL_ROOT) ] ; then mkdir -p $(GCROSSTOOL_ROOT) ; fi
	@if ! [ -d $(GCROSSTOOL_NAME) ] ; then cd $(GCROSSTOOL_ROOT) && wget $(GCROSSTOOL_URL) ; fi
	@if ! [ -d $(GCROSSTOOL_NAME) ] ; then cd $(GCROSSTOOL_ROOT) && tar xJfv $(GCROSSTOOL_ARCHIVE) ; fi
	@if [ -f $(GCROSSTOOL_ARCHIVE) ] ; then cd $(GCROSSTOOL_ROOT) && rm -f $(GCROSSTOOL_ARCHIVE) ; fi
crosstool_boot:
	@cd $(GCROSSTOOL_NAME) && ./bootstrap
crosstool_config:
	@cd $(GCROSSTOOL_NAME) && ./configure --enable-local
crosstool_make:
	@cd $(GCROSSTOOL_NAME) && make
crosstool_install:
	@cd $(GCROSSTOOL_NAME) && sudo make install
crosstool_list:
	@cd $(GCROSSTOOL_NAME) && ./ct-ng list-samples $(argv)
crosstool_show:
	@cd $(GCROSSTOOL_NAME) && ./ct-ng show-$(GCROSSTOOL_COMPILER)
crosstool_select:
	@cd $(GCROSSTOOL_NAME) && ./ct-ng $(GCROSSTOOL_COMPILER)
#================================================	
# ptxdist
ptxdist_download:
	@if ! [ -d $(GPTXDIST_ROOT) ] ; then mkdir -p $(GPTXDIST_ROOT) ; fi
	@if ! [ -d $(GPTXDIST_NAME) ] ; then cd $(GPTXDIST_ROOT) && wget $(GPTXDIST_URL) ; fi
	@if ! [ -d $(GPTXDIST_NAME) ] ; then cd $(GPTXDIST_ROOT) && tar xjfv $(GPTXDIST_ARCHIVE) ; fi
	@if [ -f $(GPTXDIST_ARCHIVE) ] ; then cd $(GPTXDIST_ROOT) && rm -f $(GPTXDIST_ARCHIVE) ; fi
ptxdist_config:
	@cd $(GPTXDIST_NAME) && ./configure
ptxdist_build:
	@cd $(GPTXDIST_NAME) && make
ptxdist_install:
	@cd $(GPTXDIST_NAME) && make install
ptxdist_remove:
	@rm -rf $(GPTXDIST_NAME)
ptxdist_setup:
	@ptxdist setup
ptxdist_platform:
	@ptxdist platformconfig
#================================================	
# linux_kernel
linux_download:
	@if ! [ -d $(GLINUX_ROOT) ] ; then mkdir -p $(GLINUX_ROOT) ; fi
	@if ! [ -d $(GLINUX_NAME) ] ; then cd $(GLINUX_ROOT) && wget $(GLINUX_URL) ; fi
	@if ! [ -d $(GLINUX_NAME) ] ; then cd $(GLINUX_ROOT) && tar xzfv $(GLINUX_ARCHIVE) ; fi
	@if [ -f $(GLINUX_ARCHIVE) ] ; then cd $(GLINUX_ROOT) && rm -f $(GLINUX_ARCHIVE) ; fi
linux_config:
	@cd $(GLINUX_NAME) && make menuconfig
linux_config_show:
	@cd $(GLINUX_NAME) && more $(GLINUX_CONFIG)
linux_compile_kernel:
	@cd $(GLINUX_NAME) && make
linux_compile_module:
	@cd $(GLINUX_NAME) && make modules
linux_install_module:
	@cd $(GLINUX_NAME) && sudo make modules_install
linux_install_kernel:
	@cd $(GLINUX_NAME) && sudo make install
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
git_config:
	@git config --global user.name "$(GGIT_USER)"
	@git config --global user.email "$(GGIT_EMAIL)"
	@git config --global core.editor "$(GGIT_EDITOR)"
	@git config --list
git_store:
	@git config --global credential.helper store
#================================================	
# unix
unix_reboot:
	@sudo shutdow -r now
unix_version:
	@cat /proc/version
unix_kernel_version:
	@uname -mr
unix_kernel_list:
	@cmd/unix_kernel_list
#================================================	
