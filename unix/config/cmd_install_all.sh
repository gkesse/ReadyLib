#!bin/bash
#================================================
GLib_Generate() {
    for lFile in ./*.sh ; do
        if [ "$lFile" != "./cmd_install_all.sh" ] ; then . $lFile ; fi
    done
}
#================================================
GLib_Generate
#================================================
