#!/bin/bash -e

echo "LaTeX umgebung wird erstellt"

# erstellen vom der Tex datei
read -p "Document name:" docName
touch "latex.tex"


# setting the Document type
read -p "was für ein Documenten Typ willst du haben?
article, report, book, beamer, standalone, letter, moderncv
Type: " docType

if [ $docType = article ]
    then
        echo '\documentclass{article}' >> latex.tex
elif [ $docType = report ]
    then
        echo '\documentclass{report}' >> latex.tex
elif [ $docType = book ] 
    then
        echo '\documentclass{book}' >> latex.tex
elif [ $docType = beamer ]
    then
        echo '\documentclass{beamer}' >> latex.tex
elif [ $docType = standalone ]
    then
        echo '\documentclass{standalone}' >> latex.tex
elif [ $docType = moderncv ]
    then
        echo '\documentclass{moderncv}' >> latex.tex
else
    echo "invalid Type"
    exit 1
fi
echo $docType set

echo >> latex.tex "
\usepackage[ngerman]{babel}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{hyperref}"

