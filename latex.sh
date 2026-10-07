#!/bin/bash -e

echo "LaTeX umgebung wird erstellt"

# erstellen vom der Tex datei
read -p "Document name:" docName
touch "$docName.tex"


# setting the Document type
read -p "was für ein Documenten Typ willst du haben?
article, report, book, beamer, standalone, letter, moderncv
Type: " docType

if [ $docType = article ]
    then
        echo '\documentclass{article}' >> "$docName.tex"
elif [ $docType = report ]
    then
        echo '\documentclass{report}' >> "$docName.tex"
elif [ $docType = book ] 
    then
        echo '\documentclass{book}' >> "$docName.tex"
elif [ $docType = beamer ]
    then
        echo '\documentclass{beamer}' >> "$docName.tex"
elif [ $docType = standalone ]
    then
        echo '\documentclass{standalone}' >> "$docName.tex"
elif [ $docType = moderncv ]
    then
        echo '\documentclass{moderncv}' >> "$docName.tex"
elif [ $docType = letter ]
    then
        echo '\documentclass{letter}' >> "$docName.tex"
else
    echo "invalid Type"
    exit 1
fi
echo $docType set

echo >> "$docName.tex" '
\usepackage[ngerman]{babel}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{hyperref}'

# set Titel
read -p "Titel: " titel
echo '
\title{'$titel'}' >> "$docName.tex" 

# set Author
read -p "Author: " author
echo '\author{'$author'}' >> "$docName.tex"

echo '
\begin{Document}

\end{Document}' >> "$docName.tex"

echo "LaTeX umgebung erstellt"