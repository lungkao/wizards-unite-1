import * as glob from 'glob';
import Shared from './shared';

function GenerateWebFriendlyUrl(file: string) {
    return file.replace(Shared.ImageRoot, "https://wizardsunitehub.info/wp-content/uploads/2019/04/")
}

function GenerateWebFriendlyName(file: string, nameRegex: RegExp) {
    if(file.match(nameRegex)) {
        let name = (file.match(nameRegex) as RegExpMatchArray)[0].replace(nameRegex, "$1");
        return name;
    }

    return null;
}

Shared.ImagePaths.PNGsForMinification.forEach(path => {
    glob(path, function(error, matches) {
        matches.forEach((file: string) => {

            if(GenerateWebFriendlyName(file, Shared.Regexes.Spell)) {
                console.log(`${ GenerateWebFriendlyName(file, Shared.Regexes.Spell) }`);
            }

            if(GenerateWebFriendlyName(file, Shared.Regexes.Item_Potion)) {
                console.log(`${ GenerateWebFriendlyName(file, Shared.Regexes.Item_Potion) }`);
            }
            
            if(GenerateWebFriendlyName(file, Shared.Regexes.Item_Ingredient)) {
                console.log(`${ GenerateWebFriendlyName(file, Shared.Regexes.Item_Ingredient) }`);
            }

        });
    })
});

