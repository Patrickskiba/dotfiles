const readline = require('readline')

const categories = ` Category : 
1) Grocery
2) Grocery
3) Grocery
4) Grocery
5) Grocery
6) Grocery
7) Grocery
8) Grocery
`

const creditCards = ` Credit Card : 
1) Amex
2) Chase
3) Capital One
`

if(process.argv[2]) {
    const pipe = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
        terminal: false
    })

    const input = process.argv[2].split('\n')

    const creditCard = (idx, cb, state) => pipe.question(creditCards, cc => {
        switch (cc) {
            case 1:
                return creditCard(idx, cb, {...state, category: '' })
            case 2:
                return creditCard(idx, cb, {...state, category: '' })
            case 3:
                return creditCard(idx, cb, {...state, category: '' })
        }
        return cb(idx + 1)
    })

    const category = (idx, cb, state) => pipe.question(categories, category => {
        switch (category) {
            case 1:
                return creditCard(idx, cb, {...state, category: '' })
            case 2:
                return creditCard(idx, cb, {...state, category: '' })
            case 3:
                return creditCard(idx, cb, {...state, category: '' })
            case 4:
                return creditCard(idx, cb, {...state, category: '' })
            case 5:
                return creditCard(idx, cb, {...state, category: '' })
            case 6:
                return creditCard(idx, cb, {...state, category: '' })
            case 7:
                return creditCard(idx, cb, {...state, category: '' })
            case 8:
                return creditCard(idx, cb, {...state, category: '' })
            case 9:
                return creditCard(idx, cb, {...state, category: '' })
        }
    })

    const whoPays = (idx, cb) => pipe.question('Erin|Patrick|Both (E|P|B) : ', answer => {
        if(answer.toLowerCase() === 'erin' || answer.toLowerCase() === 'e') return category(idx, cb, { person: 'erin' })
        else if(answer.toLowerCase() === 'patrick' || answer.toLowerCase() === 'p') return category(idx, cb, { person: 'patrick' })
        else if(answer.toLowerCase() === 'both' || answer.toLowerCase() === 'b') return category(idx, cb, { person: 'both' })
        else return cb(idx)
    })

    const loop = (idx) => {
        if(input[idx] === undefined) return pipe.close()
        console.log(`${input[idx]} : `)

        whoPays(idx, loop)
    }

    loop(0)
}
