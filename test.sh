#!/bin/bash -e

name=Clemens

echo $name

echo "Hello World" > ./hello-World.txt

chmod a+r ./hello-World.txt
chmod a-w  ./hello-World.txt
chmod a-x  ./hello-World.txt