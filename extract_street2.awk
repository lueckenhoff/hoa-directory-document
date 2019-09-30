BEGIN	{ last_street = "fnord" }	
	{
#Brushboro Drive;9225;Levering
street_name = $1
street_num = $2
lastname = $3
if ((NR > 1) && (street_name != last_street)) {
	printf(" &  & \\\\\n");
	print("\\midrule");
}
printf("%s & %s & %s \\\\\n", street_name, street_num, lastname);
print("\\midrule");
last_street = street_name
	}
