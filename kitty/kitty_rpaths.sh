#!/bin/bash
# fix kitty rpaths

install_name_tool -id "@executable_path/../Frameworks/kitty/kitty/fast_data_types.so" kitty.app/Contents/Frameworks/kitty/kitty/fast_data_types.so
install_name_tool kitty.app/Contents/Frameworks/kitty/kitty/fast_data_types.so -change /usr/local/opt/glfw/lib/libglfw.3.dylib @executable_path/../Frameworks/libglfw.3.dylib
install_name_tool kitty.app/Contents/Frameworks/kitty/kitty/fast_data_types.so -change /usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/Python @executable_path/../Frameworks/Python.framework/Versions/3.6/Python
install_name_tool kitty.app/Contents/MacOS/kitty -change /usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/Python @executable_path/../Frameworks/Python.framework/Versions/3.6/Python
