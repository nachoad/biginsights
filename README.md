Scripts and other stuff for IBM BigInsights
========================================

# Index

- [URLs in BigInsights](#urls-in-a-biginsights-installation-default)
- [Scripts](#scripts)
    - [Do](#dosh): Script for execute commands in various nodes with one command.
    - [Do-copy](#do-copysh): Script for copy from one node to various nodes.
    - [JSqsh](#jsqshsh): Script for easy access to JSqsh.
- [Examples of use](#more-examples)


# URLs in a BigInsights installation (default)
Ambari console:
```
http://<ip-biginsights>:8080
```

BigInsights Home:
```
https://<ip-biginsights>:8443/gateway/default/BigInsightsWeb/index.html
```


# Scripts


## do.sh
#### How to use it
Edit the do.sh script in an editor. Change the nodes list for your node list. Change the permissions of the script, and run it!

#### Example
List the hostnames of all the nodes with one command.
```
# ./do “hostname”
```

[Change permissions](#permissions) of the new file created if needed.

## do-copy.sh
#### How to use it
Edit the do-copy.sh script in an editor. Change the nodes list for your node list. Change the permissions of the script, and run it!

#### Example
Copy /etc/hosts in all the nodes in just one command.
```
# ./do-copy /etc/hosts
```

[Change permissions](#permissions) of the new file created if needed.

## jsqsh.sh
#### How to use it
Edit the jsqsh.sh script in an editor. Change the variable _path_ of your JSqsh if needed. Create a query.sql on the same folder, and execute the script.

_Note: Before of this, you must have the connection to the DB configured. If not, enter on the jsqsh console, type \setup and 'c' for the Connection Wizard, and configure the connection._

#### query.sql file example
```
select tabschema, colname, colno, typename, length
from syscat.columns
fetch first 10 rows only;
```
#### Use example
```
# ./jsqsh.sh -i query.sql
```

[Change permissions](#permissions) of the new file created if needed.

# More examples
```
./do “yum install -y ksh"
./do “yum install -y ntp"
./do “systemctl start ntpd.service"
./do “systemctl entable ntpd.service"
./do “ntpstat"
./do “systemctl restart ntpd.service"
./do “setenforce 0”
./do-copy /etc/sysconfig/selinux
./do “systemctl stopfirewalld"
```

# Permissions
If you have issues with the permissions, just change the permissions of the new files:
```
// Changing permissions if needed
# chmod +x ./jsqsh.sh
# chmod +x ./do-copy
```
