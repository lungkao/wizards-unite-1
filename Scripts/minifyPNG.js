const imagemin = require('imagemin');
const imageminPngquant = require('imagemin-pngquant');  
const paths = require('./paths');


imagemin(paths.exportables, paths.minifyImages_output, {
    plugins: [
        imageminPngquant()
    ]
}).then(() => {
    console.log('Images optimized');
});
 