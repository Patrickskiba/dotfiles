const readline = require('readline')

if(process.argv[2]) {
    const pipe = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
        terminal: false
    })

    const input = process.argv[2].split('\n')

    const loop = (idx) => {
        if(input[idx] === undefined) return pipe.close()
        pipe.question(`${input[idx]} : `, answer => {
            console.log(answer)
            return loop(idx + 1)
        })
    }

    loop(0)
}
