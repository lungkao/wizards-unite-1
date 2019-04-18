import * as imagemin from 'imagemin';
import imageminPngquant from 'imagemin-pngquant';

import Shared from './shared';

imagemin(Shared.ImagePaths.PNGsForMinification, Shared.ImageOutputFolder, {
    plugins: [
        imageminPngquant()
    ]
}).then(() => {
    console.log('Images optimized');
});
 