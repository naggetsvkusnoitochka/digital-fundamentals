#!/bin/bash
min=228
infomin=""
max=0
infomax=""
for i in $(ls $1)
do
    for string in $(cat $1$i)
    do
        age=$(echo $string | cut -d ":" -f2)
        if [[ $age -gt $max ]]
        then 
            max=$age
            name=$(echo $string | cut -d ":" -f1)
            email=$(echo $string |  cut -d ":" -f3)
            infomax=$(echo -e "Имя: $name, возраст: $age, почта: $email")
        fi
        if [[ $age -lt $min ]]
        then
            min=$age
            name=$(echo $string | cut -d ":" -f1)
            email=$(echo $string | cut -d ":"  -f3)
            infomin=$(echo -e "Имя: $name, возраст: $age, почта: $email")
        fi
    done
done
            
echo $infomin
echo $infomax
