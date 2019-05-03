diff act.csv act2.csv | grep -E '^>' | sed 's/>\s//g' | awk -F ',' '{ print $1","$3","$4","$6 }'
