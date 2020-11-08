#!/bin/sh -x
# Step 1: Create name-directory from raw data
# The sort "--key" things mean "first sort by field #5 (last name),
# then by field #9 (person1 first name).
grep -v '^#' hoa.csv | sort --field-separator=, --key=5,5 --key=9,9 | gawk -F, -f extract_directory.awk > directory_data.tex

# Step 2: Create street-directory from raw data
# first sorting by street name (field 1),
# then by street number as numeric (field 2)
awk -F, -f extract_street.awk hoa.csv | \
	sort --field-separator=\; -k 1,1 -k 2,2n | \
	awk -F\; -f extract_street2.awk > street_data.tex

# Step 3: Run LaTeX on it to create the .PDF output
pdflatex doc.tex

