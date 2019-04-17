const glob = require("glob");
const paths = require('./paths');

paths.exportables.forEach(path => {
    glob(path, function(error, matches) {
        console.log(matches);
    })
});

