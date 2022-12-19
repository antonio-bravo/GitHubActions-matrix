filename='./variables.env'
filter='OS=*'

while read line; do
    if  [[ $line == $filter ]] ;
    then
        echo "$line"
    fi
done < $filename