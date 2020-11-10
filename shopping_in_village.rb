grocery = {
    tomato: '1 kg',
    cucumbers: '1,5 kg',
    bread: '1 piece',
    milk: '1 bottle',
    fresh_meat: '2 kg'
}

household = {
    washing_powder: '2 pieces',
    sponge_for_washing_dish: '10 pieces',
    rubbish_bag: '1 package',
    baking_foil: '1 roll',
    toothpaste: '1 tube'
}

shopping_list = grocery.merge(household)

shopping_list.each { |key, value| puts "#{key}: #{value}" }
