path=/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh
echo "JSqsh path: $path"
echo "Executing the SQL '$1' with JSqsh:"

$path $1
