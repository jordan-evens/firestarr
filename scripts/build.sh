#!/bin/bash
DIR=$(realpath $(dirname $(realpath "$0"))/..)
# didn't figure out how to do this with cmake yet but this works for now
DIR_BUILD="${DIR}/build"
VARIANT="$*"
if [ -z "${VARIANT}" ]; then
  VARIANT=Release
fi
echo Set VARIANT=${VARIANT}
/usr/bin/cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=${VARIANT} -S${DIR} -B${DIR_BUILD} -G "Unix Makefiles" \
  && /usr/bin/cmake --build ${DIR_BUILD} --config ${VARIANT} --target all -j 50 --
