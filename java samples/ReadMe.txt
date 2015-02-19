
ReadMe File for TestConnection.java Example

Last update: Jan-2014
Tested on: vSphere 5.5 and later releases
On-Line Documentation and Explanation:
http://pubs.vmware.com/vsphere-55/index.jsp#com.vmware.wssdk.pg.doc/PG_Client_App.5.4.html

Introduction and Purpose

This sample code shows how to make a connection to ESX or vCenter, and
get back some simple informtion from it.  All the code needed is included in this 
one Java file.

Running This Sample

Before running this sample, you can make sure you have the right version of Java
installed and in your path by running this command:
javac -version
java -version
You should see version 1.6 or later.

You will also need to get the vim25.jar library from the VMware vSphere JDK.  It is in the
VMware-vSphere-SDK-5.5.0\vsphere-ws\java\JAXWS\lib directory, and you will need to
copy it into the "lib" directory here.

If the build fails because com/vmware/vim25 classes can not be found, you need to copy the vim25.jar
from the vSphere JDK to the lib directory here, as described above.  In this case, you will see an 
error similar to this one:
c:...\com\vmware\scia\utils\TaskUtils.java:32: package com.vmware.vim25 does not exist

In order to run this sample code you must provide three arguments:
[1] The server name or IP address
[2] The user name to log in as
[3] The password to use

You can run this sample code with a command similar to the following :
java -cp "vim25.jar;TestConnection.jar" com.vmware.scia.complete.TestConnection <ip-or-domain-name> <user> <password>
for example (on Windows):
java -cp "lib\vim25.jar:lib\TestConnection.jar" com.vmware.scia.complete.TestConnection 127.0.0.1 root rootPassword
or (on UNIX):
java -cp "lib/vim25.jar:lib/TestConnection.jar" com.vmware.scia.complete.TestConnection 127.0.0.1 root rootPassword

The 127.0.0.1 address is the local host, so will work if you are running the script from the same 
machine as vCenter is installed on.  If not, put in the vCenter machine's IP or domain name.
If you password contains strange characters that your shell uses (such as ! # ; | and so on), you 
should put quotes around it.

On UNIX machines especially, remember to quote passwords that contain shell characters, such 
as $!#:*&<> and so on.  For example, if your password is !special&secret, you'll need to put 
single quotes around it: '!special&secret'

You will see the output similar to the following when you run the sample:
c:\vmware\scia>./run_samples.sh complete.TestConnection 10.67.119.68 SimpleUser SimplePassword
VMware vCenter Server 5.5.0 build-1312298
Server type is VirtualCenter
API version is 5.5.0

If the run fails because com/vmware/vim25 classes can not be found, you need to copy the vim25.jar
from the vSphere JDK to the lib directory here, as described above.  In this case, you will see an 
error similar to this one:
Exception in thread "main" java.lang.NoClassDefFoundError: com/vmware/vim25/InvalidLoginFaultMsg

What Next?

This sample shows how to write the connection, but a better design is to have a class that encapsulates
that connection.  The VMwareConnection.java file contains such a connection and the WhichClusterIsMyVMIn.java
and CloneAndChangeVM.java samples use this class.





