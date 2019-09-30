#!/bin/sh -x
grep -v '^#' hoa.csv | sort --field-separator=, --key=5,5 --key=9,9 | gawk -F, -f extract_directory.awk > directory_data.tex
awk -F, -f extract_street.awk hoa.csv | sort --field-separator=\; | awk -F\; -f extract_street2.awk > street_data.tex
pdflatex doc.tex
