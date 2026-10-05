#!/bin/bash
#Ausgaben in Variable schreiben

#Variablendefinition
suchwort=player

liste=$(apropos $suchwort)
echo "Player-Liste:"
echo "$liste"