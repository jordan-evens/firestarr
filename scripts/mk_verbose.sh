#!/bin/bash
# didn't figure out how to do this with cmake yet but this works for now
DIR_BUILD=/appl/tbd/build
OPTIONS="-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON"
VARIANT="$*"
if [ -z "${VARIANT}" ]; then
  VARIANT=Release
fi
echo Set VARIANT=${VARIANT}
rm -rf ${DIR_BUILD} \
  && /usr/bin/cmake --no-warn-unused-cli ${OPTIONS} -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=${VARIANT} -S/appl/tbd -B${DIR_BUILD} -G "Unix Makefiles" \
  && /usr/bin/cmake --build ${DIR_BUILD} --config ${VARIANT} --target all -j 50 --

