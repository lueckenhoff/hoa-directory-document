#!/bin/sh -x
# Step 1: Create name-directory from raw data
# The sort "--key" things mean "first sort by field #5 (last name),
# then by field #9 (person1 first name).
grep -v '^#' hoa.csv | sort --field-separator=, --key=5,5 --key=9,9 | gawk -F, -f extract_directory.awk > directory_data.tex

# Step 2: Create stret-directory from raw data
awk -F, -f extract_street.awk hoa.csv | sort --field-separator=\; | awk -F\; -f extract_street2.awk > street_data.tex

# Step 3: Run LaTeX on it to create the .PDF output
pdflatex doc.tex

