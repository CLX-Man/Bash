# Bash

Small Bash scripts for shell practice. [`latex.sh`](latex.sh) asks four questions and writes a `.tex` file with a German preamble. [`test.sh`](test.sh) and [`idk.sh`](idk.sh) are shorter exercises.

The prompts in `latex.sh` are in German. You need Bash. Install a TeX distribution only if you want a PDF. Compiling is a separate step, below.

## Generate a LaTeX file

```bash
bash latex.sh
```

The scripts are not marked executable. `bash latex.sh` works without `chmod`. To run `./latex.sh`, or to use Make, set the executable bit first:

```bash
chmod +x latex.sh test.sh idk.sh
```

`latex.sh` asks for:

1. **Document name**, without `.tex`. This becomes the file name in the current directory.
2. **Document class.** One of `article`, `report`, `book`, `beamer`, `standalone`, `letter`, `moderncv`. Any other answer prints `invalid Type` and exits with status 1.
3. **Title.**
4. **Author.**

A successful run writes a skeleton like this:

```latex
\documentclass{letter}

\usepackage[ngerman]{babel}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{hyperref}

\title{Vorlesung 1}
\author{Clemens Eberwien}

\begin{Document}

\end{Document}
```

[`VL 1.tex`](VL%201.tex) is a finished copy of that skeleton. Use a document name without spaces. The sample name `VL 1` contains a space: the file is created and filled through the author line, then the last append fails with `ambiguous redirect` and `\begin{Document}` is missing.

## Run it from a text file

Put the four answers on their own lines, in the same order as the prompts. [`antworten.txt`](antworten.txt) is a sample. Its first line is `VL 1`, so that file hits the space problem above. Save the four lines below as `answers.txt`. The name `VL1` has no space, and the run writes a complete `VL1.tex`:

```text
VL1
letter
Vorlesung 1
Clemens Eberwien
```

```bash
bash latex.sh < answers.txt
```

## Compile

The script writes `\begin{Document}` and `\end{Document}`. LaTeX environment names are case-sensitive, so change both to `document` before you compile:

```bash
pdflatex VL1.tex
```

`moderncv` also needs a style command, for example `\moderncvstyle{casual}`, which the script does not add.

You need a TeX distribution that provides `pdflatex`, such as TeX Live, plus the packages named in the skeleton (`babel` with the `ngerman` option, `fontenc`, `lmodern`, `hyperref`, and the document class you chose).

## Other scripts

`test.sh` asks `Name:` and writes one line, `Hallo <name>`, to `test.tex`. The commented block at the top is an earlier exercise on variables and quoting.

```bash
bash test.sh
```

`idk.sh` runs `apropos player` and prints the matching manual-page summaries under the heading `Player-Liste:`. The search word is fixed in the script. You need `apropos` (from `man-db`) and a built whatis database. On Debian or Ubuntu, build it with `sudo mandb` if the list comes back empty.

```bash
bash idk.sh
```

## Make

The Makefile calls `./latex.sh` and `./test.sh`, so those files must be executable (`chmod +x`, above).

| Target | Effect |
| --- | --- |
| `make test.tex` | Runs `test.sh` and waits for a name. Writes `test.tex`. |
| `make latex.tex` | Runs `./latex.sh < antworten.txt`. The target name is not the output file. With the sample answers, the run stops on `ambiguous redirect` because the document name contains a space. |
| `make clean` | Deletes every `.tex` file in this directory, including `VL 1.tex`. |

## License

[MIT](LICENSE). Copyright 2026 CLX.