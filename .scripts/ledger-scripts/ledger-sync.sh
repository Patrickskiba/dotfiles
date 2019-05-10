IFS="\\"
transactions=($(diff act.csv act2.csv | grep -E '^>' | sed 's/>\s//g' | awk -F ',' '{ print $1","$3","$4","$6"\\" }'))

for tran in "${transactions[@]}"
do
    echo $tran
    read -p "Was this purchase made by Erin, Patrick or Both? (E/P/B) : " WHO
    case $WHO in
        [Ee]* ) WHO="Erin";;
        [Pp]* ) WHO="Patrick";;
        [Bb]* ) WHO="Both";;
    esac

    CATEGORIY=$(awk 'BEGIN { print "Grocery\nResturant\nAlcohol\nBills\nRent\nEntertainment\nHome\nOther"}' | fzy |  tr -d '\n\r')

    case $CATEGORIY in
        Other) read -p "Enter Category : " CATEGORIY;;
    esac

    CreditCard=$(awk 'BEGIN { print "Amex\nCapitalOne\nChase\nTravelAmex\nMarriott"}' | fzy |  tr -d '\n\r')

    DATE=$(echo $tran | awk -F ',' '{ print $1 }')

    DESCRIPTION=$(echo $tran | awk -F ',' '{ print $2 }' | tr -d '\n\r')

    AMOUNT=$(echo $tran | awk -F ',' '{ print $4 }' | tr -d '\n\r')

    if [ "$WHO" = "Erin" ] || [ "$WHO" = "Patrick" ]; then
        printf "$DATE * \"$DESCRIPTION\"\n" >> transactions.bean
        printf "Expenses:$WHO:$CATEGORIY     $AMOUNT USD\n" >> transactions.bean
        printf "Liabilities:$WHO:$CreditCard\n" >> transactions.bean
    fi

    if [ "$WHO" = "Both" ]; then
        SPLIT_AMOUNT=$(echo $AMOUNT | awk '{ print $0 / 2}')

        printf "$DATE * \"$DESCRIPTION\"\n" >> transactions.bean
        printf "Expenses:Patrick:$CATEGORIY     $SPLIT_AMOUNT USD\n" >> transactions.bean
        printf "Liabilities:Patrick:$CreditCard\n\n" >> transactions.bean

        printf "$DATE * \"$DESCRIPTION\"\n" >> transactions.bean
        printf "Expenses:Erin:$CATEGORIY     $SPLIT_AMOUNT USD\n" >> transactions.bean
        printf "Liabilities:Erin:$CreditCard\n" >> transactions.bean
    fi
done

