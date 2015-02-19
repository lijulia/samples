# ******************************************************
# Copyright VMware, Inc. 2014.  All Rights Reserved.
# ******************************************************
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Building Sample Code for Infrastructure Automation....."

rm -f lib/scia10.jar 

LOCALCLASSPATH=""
for JAR_FILE in lib/*.jar ; do
    LOCALCLASSPATH="${JAR_FILE}:${LOCALCLASSPATH}"
done

echo "Compiling samples"
javac -classpath "$LOCALCLASSPATH" `find com -name \*.java -print` 

echo "Jarring samples"
echo jar cf lib/scia10.jar `find . -name \*.class -print`
jar cf lib/scia10.jar `find com -name \*.class -print`

rm `find com -name \*.class -print` 

echo ""
echo "Finished compiling sample code.  Unless there were errors, the new scia10.jar file is in lib."

