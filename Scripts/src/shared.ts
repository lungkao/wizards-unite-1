const Shared = {

    ImageRoot: "../Assets/Sprite/",

    ImagePaths: [
        '../Assets/Sprite/spellpath_*.png',
        '../Assets/Sprite/ui_item_potion_*.png',
        '../Assets/Sprite/ui_item_ingredients_*.png'
    ],

    Regexes: {
        Spell: /spellpath_(.*)\./gi,
        Item_Ingredient: /ui_item_ingredients_(.*)\./gi,
        Item_Potion: /ui_item_potion_(.*)\./gi,
    },

    ImageOutputFolder: 'output/images',
}

export default Shared;