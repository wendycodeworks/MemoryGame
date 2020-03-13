#Create it number of cards array from [1-numberofcards]

def numbersoncard(number_of_card, number_on_card)
    for i in 1..number_of_card
        number_on_card.push(i)
    end
    return number_on_card
end