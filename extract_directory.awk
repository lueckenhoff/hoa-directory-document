BEGIN	{ print("\\section{}"); }
	{
#Deliv.Grp,Year Arrive,Dues,Note,Last Name,Street #,Street Name,Home Phone,First Name 1,E-mail Address 1,Cell Phone 1,Occupation 1,Hometown 1,State 1,First Name 2,E-mail Address 2,Cell Phone 2,Occupation 2,Hometown 2,State 2,Child 1,Child 2,Child 3,Child 4,Child 5,,
note = tolower($4)
if (match(note, "nopublish") >= 1) {
	next
}
lastname = $5
#printf("lastname = '%s'\n", lastname);
street_num= $6
#printf("street_num = '%s'\n", street_num);
street_name = $7
#printf("street_name = '%s'\n", street_name);
home_phone = $8
#printf("home_phone = '%s'\n", home_phone);
firstname1 = $9
#printf("firstname1 = '%s'\n", firstname1);
email1 = $10
#printf("email1 = '%s'\n", email1);
cellphone1 = $11
#printf("cellphone1 = '%s'\n", cellphone1);
# occupation1
hometown1 = $13
homestate1 = $14
#printf("hometown1= '%s' homestate1='%s'\n", hometown1, homestate1);
firstname2 = $15
#printf("firstname2 = '%s'\n", firstname2);
email2 = $16
#printf("email2 = '%s'\n", email2);
cellphone2 = $17
#printf("cellphone2 = '%s'\n", cellphone2);
# occupation2
hometown2 = $19
homestate2 = $20
#printf("hometown2= '%s' homestate2='%s'\n", hometown2, homestate2);
child1 = $21
child2 = $22
child3 = $23
child4 = $24
child5 = $25
child6 = $26
#printf(" child1='%s'", child1);
#printf(" child2='%s'", child2);
#printf(" child3='%s'", child3);
#printf(" child4='%s'", child4);
#printf(" child5='%s'", child5);
#printf(" child6='%s'", child6);
#printf("\n");

#print("\\renewcommand\\arraystretch{0.8}");
#print("\\renewcommand{\\tabcolsep}{3pt}");

print("\\begin{center}");
#print("\\begin{tabular}{ p{0.20\\textwidth} p{0.70\\textwidth} }");
print("\\begin{tabular}{ p{0.16\\textwidth} p{0.49\\textwidth} p{0.25\\textwidth} }");
print("\\toprule");
printf("{\\bf %s} &", lastname);
printf(" %s %s & ", street_num, street_name);
home_suffix = " (H)"
cell_suffix = " (C)"
if (length(home_phone)) {
	printf("%s%s", home_phone, home_suffix);
}
print(" \\\\");
#printf("Home Phone: & ", home_phone);
#printf("%s", (length(home_phone) > 0) ? home_phone : "none");
#if (length(home_phone)) {
#	printf("%s", home_phone);
#} else {
#	printf("none");
#}
#print(" \\\\\n");


#print("\\midrule");
#printf("%s ", firstname1);
printf("\\multirow{2}{*}{%s}", firstname1);
printf(" & Email: \\verb'%s' &", email1)
if (length(cellphone1)) {
	printf("%s%s", cellphone1, cell_suffix)
}
printf("\\\\\n")
if (length(hometown1)) {
	printf(" & Hometown: %s, %s \\\\\n ", hometown1, homestate1);
} else {
	printf(" & Hometown: \\\\\n ");
}
#print("\\midrule");
#printf("%s ", firstname2);
printf("\\multirow{2}{*}{%s}", firstname2);
printf(" & Email: \\verb'%s' &", email2)
if (length(cellphone2)) {
	printf("%s%s", cellphone2, cell_suffix)
}
printf("\\\\\n")
if (length(hometown2)) {
	printf(" & Hometown: %s, %s \\\\\n ", hometown2, homestate2);
} else {
	printf(" & Hometown: \\\\\n ");
}

if (length(child1)) {
#	print("\\midrule");
	printf("Children: & ");
	print("\\multicolumn{2}{l}{");
	printf("%s", child1);
	if (length(child2)) {
		printf(", %s", child2);
	}
	if (length(child3)) {
		printf(", %s", child3);
	}
	if (length(child4)) {
		printf(", %s", child4);
	}
	if (length(child5)) {
		printf(", %s", child5);
	}
	if (length(child6)) {
		printf(", %s", child6);
	}
	print("}");
	print(" \\\\");
}
#print("\\bottomrule");
print("\\end{tabular}");
print("\\end{center}");
print("\\vspace{-1.5em}");
print("");
	}
END	{ }
