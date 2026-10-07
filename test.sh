#!/bin/bash -e

#anfang vom programm

# name=Clemens
# massage=Hello
# massage2=here\ are\ spaces\ lol

# text="Headline
# email oder so gewechselt.
# more.
# more."

# echo $massage $name
# echo $massage2
# echo "$text"


read -p "Name:" name
echo "Hallo $name" >> "test.tex"