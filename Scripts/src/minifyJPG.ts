import * as imagemin from 'imagemin';
import * as jpegtran from 'imagemin-jpegtran';

import Shared from './shared';

imagemin(Shared.ImagePaths.JPGsForMinification, Shared.ImageOutputFolder, {
    plugins: [
        jpegtran()
    ]
}).then(() => {
    console.log('Images optimized');
});
 