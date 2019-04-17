const fs = require('fs');
const args = require('args');
 
args
  .option('inputFile', 'The file that needs to be decoded');
 
const flags = args.parse(process.argv)

const regexes = [
    { search: /\.get/gi, replace: '\n.get' },
    { search: /\.set/gi, replace: '\n.set' },
    { search: /\./gi, replace: '\n.' },
]

if(flags.inputFile) {
    console.time(`Decoding ${ flags.inputFile }`);
    
    fs.readFile(`input/${ flags.inputFile }`, (err, file) => {

        var asciiFormat = file.toString('ascii');

        regexes.forEach(regex => {
            asciiFormat = asciiFormat.replace(regex.search, regex.replace);
        });

        fs.writeFile(`output/${ flags.inputFile }_decoded.txt`, asciiFormat, { encoding: 'ascii' }, (err) => {
            if(err) {
                console.log(err)
            } else {
                console.log("Decoding finished");
                console.timeEnd(`Decoding ${ flags.inputFile }`);
            }
        });
    });
    
}