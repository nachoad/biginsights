path=/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh

echo "JSqsh path: $path"
echo "Executing the SQL '$2' with JSqsh:"
echo "----------------------------------"

$path $2
