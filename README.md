Scripts and other stuff for IBM BigInsights
========================================

do.sh
-----
**How to use it**:
Edit the do.sh script in an editor. Change the nodes list for your node list. Change the permissions of the script, and run it!

```
// Change permissions
# chmod +x ./do
```
> Example. List the hostnames of all the nodes with one command.
```
# ./do “hostname”
```

do-copy.sh
-------
**How to use it**:
Edit the do-copy.sh script in an editor. Change the nodes list for your node list. Change the permissions of the script, and run it!

```
// Change permissions
# chmod +x ./do-copy
```
> Example. Copy /etc/hosts in all the nodes in just one command.
```
# ./do-copy /etc/hosts
```