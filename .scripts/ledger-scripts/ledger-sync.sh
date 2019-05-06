IFS="\\"
transactions=($(diff act.csv act2.csv | grep -E '^>' | sed 's/>\s//g' | awk -F ',' '{ print $1","$3","$4","$6"\\" }'))

for tran in "${transactions[@]}"
do
    echo $tran
    read -p "Was this purchase made by Erin, Patrick or Both? (E/P/B) : " who
    echo $yn
done

