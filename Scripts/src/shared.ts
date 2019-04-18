const Shared = {

    ImageRoot: "../Assets/Sprite/",

    ImagePaths: {
        PNGsForMinification: [
            '../Assets/Sprite/spellpath_*_light.png',
            '../Assets/Sprite/ui_item_potion_*.png',
            '../Assets/Sprite/ui_item_ingredients_*.png'
        ],

        JPGsForMinification: [
            'output/images/*.jpg'
        ],
    },

    Regexes: {
        Spell: /spellpath_(.*)_light\./gi,
        Item_Ingredient: /ui_item_ingredients_(.*)\./gi,
        Item_Potion: /ui_item_potion_(.*)\./gi,
    },

    ImageOutputFolder: 'output/images'
}

export default Shared;