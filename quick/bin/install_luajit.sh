#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="`dirname $DIR`"
LUAJIT_SRC_DIR="$QUICK_V3_ROOT/quick/lib/LuaJIT-2.0.3"

XCODE_PATH=`xcode-select -p`
if [ ! -d "$XCODE_PATH" ]; then
    echo PLEASE INSTALL XCODE AND XCODE COMMAND LINE TOOLS.
    exit
fi

cd $LUAJIT_SRC_DIR
make

echo ""
echo ""
echo Install LuaJIT, please enter your password.
echo ""
echo "sudo make install"
sudo make install
echo ""
echo "LuaJIT install successed."
echo ""
