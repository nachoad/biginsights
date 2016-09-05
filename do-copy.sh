declare -a nodes=(
"n1.ibm.com"
"n2.ibm.com"
"n3.ibm.com"
"n4.ibm.com"
)

for i in "${nodes[@]}"
do
     scp "$1" "$i":"1"
done