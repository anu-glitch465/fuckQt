# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appprojettback_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appprojettback_autogen.dir/ParseCache.txt"
  "appprojettback_autogen"
  )
endif()
