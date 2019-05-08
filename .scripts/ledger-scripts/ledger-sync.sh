IFS="\\"
transactions=($(diff act.csv act2.csv | grep -E '^>' | sed 's/>\s//g' | awk -F ',' '{ print $1","$3","$4","$6"\\" }'))

for tran in "${transactions[@]}"
do
    echo $tran
    read -p "Was this purchase made by Erin, Patrick or Both? (E/P/B) : " WHO
    case $WHO in
        [Ee]* ) echo "It was Erin!";;
        [Pp]* ) echo "It was Patrick!";;
        [Bb]* ) echo "Both did it";;
    esac

    CATEGORIY=$(awk 'BEGIN { print "Grocery\nResturant\nAlcohol\nBills\nRent\nEntertainment\nHome\nOther"}' | fzy)

    case $CATEGORIY in
        Other) read -p "Enter Category : " CATEGORIY;;
    esac

    CreditCard=$(awk 'BEGIN { print "CapitalOne\nAmex\nChase\nTravelAmex\nMarriott"}' | fzy)

    echo $CreditCard

done

