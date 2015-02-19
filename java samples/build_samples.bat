@echo off
@rem  ******************************************************
@rem  Copyright VMware, Inc. 2014.  All Rights Reserved.
@rem  ******************************************************
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.

echo Building Sample Code for Infrastructure Automation.....

if exist lib\scia10.jar (
  del /q/f lib\scia10.jar >nul 2>nul
)

echo setting up LOCALCLASSPATH
set LOCALCLASSPATH=%CD%\lib;
for %%i in ("lib\*.jar") do call lcp.bat %CD%\%%i
cd com\vmware\scia
@rem find all *.java files
dir *.java /b/s > ..\..\..\java_src.txt
cd ..\..\..

echo Compiling samples
echo javac -classpath "%LOCALCLASSPATH%" @java_src.txt
javac -classpath "%LOCALCLASSPATH%" @java_src.txt || goto ERROR

echo Jarring samples
echo jar cf lib\scia10.jar com\vmware\scia\utils\*.class com\vmware\scia\complete\*.class com\vmware\scia\general\*.class
jar cf lib\scia10.jar com\vmware\scia\utils\*.class com\vmware\scia\complete\*.class com\vmware\scia\general\*.class com\vmware\scia\workflows\*.class  || goto ERROR

del /q/f java_src.txt >nul 2>nul
del /s/q/f *.class >nul 2>nul

goto EOF

:ERROR
@echo FAILED
@exit /b 1

:EOF
