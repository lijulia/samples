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

@rem Collects all arguments and puts them in LOCALCLASSPATH

set _CLASSPATHCOMPONENT=%1
if ""%1""=="""" goto gotAllArgs
shift

:argCheck

if ""%1""=="""" goto gotAllArgs
set _CLASSPATHCOMPONENT=%_CLASSPATHCOMPONENT% %1
shift

goto argCheck

:gotAllArgs
set LOCALCLASSPATH=%LOCALCLASSPATH%;%_CLASSPATHCOMPONENT%

