# VIM Configuration


## YCM Config for C/C++:
1. Set default YCM Config File as:`let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'` in `.vimrc`
2. Set Flags in '.ycm\_extra\_conf.py' as: (if using **C**,using `C99`&`c` in follow:

```
 flags = [
 '-Wall',
 '-Wextra',
 '-Werror',
 '-Wno-long-long',
 '-Wno-variadic-macros',
 '-fexceptions',
 '-DNDEBUG',
 '-std=c++11',
 '-x',
 'c++',
 #'.' is oppsite to ycm configuration pwd
 #'-I',
 #'.',
 '-isystem',
 '/usr/include',
 #Cancel this,it will make error in complete,guess confict with default path
 #'-isystem',
 #'/usr/include/c++/8.2.0',
 '-isystem',
 '/usr/local/include',
 '-isystem',
 '/usr/local/include/glib-2.0',
 ]
``` 

### Option:

- You can put this file in project root path to make private ycm config for a project(so that you can include project's private path)
- Cancel ~~/usr/include/c++/8.2.0~~ , beacuse it will make error in complete,guess confict with default path.
- `'.'` set in YCM config file is oppsite to the config file path.So pay attention when using the YCM.
- Check more detail run vim with command `:YcmDebugInfo` like follow:

~~~
Printing YouCompleteMe debug information...
-- Client logfile: /var/folders/ym/939l763x7_x4d09c31s99rd00000gn/T/ycm_zjbqwyta.log
-- Server Python interpreter: /usr/bin/python
-- Server Python version: 2.7.10
-- Server has Clang support compiled in: True
-- Clang version: Apple LLVM version 10.0.0 (clang-1000.11.45.2)
-- Extra configuration file found and loaded
-- Extra configuration path: /Users/shuzhengyang/.vim/.ycm_extra_conf.py
-- C-family completer debug information:
--   Compilation database path: None
--   Flags: [u'-Wall', u'-Wextra', u'-Werror', u'-Wno-long-long', u'-Wno-variadic-macros', u'-fexceptions', u'-DNDEBUG', u'-std=c++11', u'-x', u'c++',
 u'-isystem', u'/usr/include', u'-isystem', u'/usr/local/include', u'-isystem', u'/usr/local/include/glib-2.0', u'-resource-dir=/Users/shuzhengyang/.v
im/bundle/YouCompleteMe/third_party/ycmd/ycmd/../clang_includes', u'-isystem', u'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xc
toolchain/usr/include/c++/v1', u'-isystem', u'/usr/local/include', u'-isystem', u'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.x
ctoolchain/usr/lib/clang/10.0.0/include', u'-isystem', u'/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
u'-isystem', u'/usr/include', u'-iframework', u'/System/Library/Frameworks', u'-iframework', u'/Library/Frameworks', u'-isystem', u'/Applications/Xcod
e.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include', u'-fspell-checking']
--   Translation unit: /Users/shuzhengyang/Desktop/project/C:C++/myNLP/src/General.cpp
-- Server running at: http://127.0.0.1:51630
-- Server process ID: 4018
-- Server logfiles:
--   /var/folders/ym/939l763x7_x4d09c31s99rd00000gn/T/ycmd_51630_stdout_wytx5xij.log
--   /var/folders/ym/939l763x7_x4d09c31s99rd00000gn/T/ycmd_51630_stderr_o8axo_84.log
~~~
`path` is manually set in config file & **default path**,and you also can find config file path & log file path.

	