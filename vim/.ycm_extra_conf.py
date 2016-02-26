# Stolen from: http://jesrui.sdf-eu.org/ycm-config-for-qt5.html
# Partially stolen from https://bitbucket.org/mblum/libgp/src/2537ea7329ef/.ycm_extra_conf.py
# Extra stuff taken from: https://gist.github.com/locojay/4950253

import os
import ycm_core
from clang_helpers import PrepareClangFlags

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

# These are the compilation flags that will be used in case there's no
# compilation database set.
flags = [
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',

# Qt 5 stuff
'-DQT_CORE_LIB',
'-DQT_GUI_LIB',
'-DQT_NETWORK_LIB',
'-DQT_QML_LIB',
'-DQT_QUICK_LIB',
'-DQT_SQL_LIB',
'-DQT_WIDGETS_LIB',
'-DQT_XML_LIB',

'-I', '/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-clang',
'-I', '/usr/include/qt5',
'-I', '/usr/include/qt5/QtConcurrent',
'-I', '/usr/include/qt5/QtCore',
'-I', '/usr/include/qt5/QtDBus',
'-I', '/usr/include/qt5/QtGui',
'-I', '/usr/include/qt5/QtHelp',
'-I', '/usr/include/qt5/QtMultimedia',
'-I', '/usr/include/qt5/QtMultimediaWidgets',
'-I', '/usr/include/qt5/QtNetwork',
'-I', '/usr/include/qt5/QtOpenGL',
'-I', '/usr/include/qt5/QtPlatformSupport',
'-I', '/usr/include/qt5/QtPositioning',
'-I', '/usr/include/qt5/QtScript',
'-I', '/usr/include/qt5/QtScriptTools',
'-I', '/usr/include/qt5/QtSql',
'-I', '/usr/include/qt5/QtSvg',
'-I', '/usr/include/qt5/QtTest',
'-I', '/usr/include/qt5/QtUiTools',
'-I', '/usr/include/qt5/QtV8',
'-I', '/usr/include/qt5/QtWebKit',
'-I', '/usr/include/qt5/QtWebKitWidgets',
'-I', '/usr/include/qt5/QtWidgets',
'-I', '/usr/include/qt5/QtXml',
'-I', '/usr/include/qt5/QtXmlPatterns',

'-I', '.',
# '-I', 'Tests',
# '-I', 'build',
# '-I', 'build/Tests',

# System include directories
'-isystem', '/usr/include',
'-isystem', '/usr/local/include',

'-Wall',
'-Wextra',
# '-Werror',
# '-Wc++98-compat',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',

]

import sys
if sys.platform == "darwin":
    flags.extend([
        '-stdlib=libc++',                      # Use this for OS X
        '-isystem', '/usr/include/c++/4.2.1',  # Change this for system!
    ])

elif sys.platform.startswith("linux"):
    flags.extend([
        '-stdlib=libstdc++',
        '-isystem', '/usr/include/c++/4.8'  # Need to change this for system!
    ])


if compilation_database_folder:
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None


def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return flags
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def FlagsForFile( filename ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = database.GetCompilationInfoForFile( filename )
    final_flags = PrepareClangFlags(
        MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_ ),
        filename )
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }
