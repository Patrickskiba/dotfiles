IFS="\\"
transactions=($(diff act.csv act2.csv | grep -E '^>' | sed 's/>\s//g' | awk -F ',' '{ print $1","$3","$4","$6"\\" }'))

for tran in "${transactions[@]}"
do
    echo $tran
    read -p "Was this purchase made by Erin, Patrick or Both? (E/P/B) : " who
    case $who in
        [Ee]* ) echo "It was Erin!";;
        [Pp]* ) echo "It was Patrick!";;
        [Bb]* ) echo "Both did it";;
    esac

    CATEGORIY=$(awk 'BEGIN { print "Grocery\nResturant\nAlcohol\nBills\nRent\nEntertainment\nHome"}' | fzy)
done

