# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org>

#########################################################################
# Determines the package dependencies for the .tex file given as the
# first argument (or the first .tex file in a listing of the current
# working directory, if no argument is provided), and lists for each
# whether it is installed or not. If invoked with the name
# install-deps.sh, it will also attempt to install packages that
# aren't installed.
#
# Caveats: This script assumes a TeXLive installation, and uses tlmgr
# to query installation status as well as to install a package. On the
# first run you may see complaints that tlmgr itself needs to be
# updated. Execute the command suggested in the error message to fix
# this; this script will intentionally not it for you. Installation of
# a package will invoke sudo, and will thus fail if you do not have
# sudo privileges on the machine on which you are trying to do this.
#########################################################################

texfile=$1
if [ "$texfile" == "" ] ; then
    texfile=`ls *.tex | head -1`
fi
if [ "$0" == "install-deps.sh" ] ; then
    install=1
fi

for pkg in `grep '\usepackage' $texfile | sed -e 's/.*{//' -e 's/}.*//'`
do
    installed=`tlmgr info $pkg 2>/dev/null | grep "installed:" | sed -e 's/.*:  *//'`
    if [ "$installed" == "Yes" ] ; then
        echo "$pkg: already installed"
    elif [ "$installed" == "No" ] ; then
        echo "$pkg: not installed"
        if [ "$install" ] ; then
            echo "*** installing $pkg:"
            sudo tlmgr install $pkg
        fi
    else
        echo "$pkg: unknown status (maybe not its own package?)"
    fi
done
