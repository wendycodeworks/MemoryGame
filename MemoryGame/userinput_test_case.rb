#Asks for card1 and card2 and tests if cards is already open or is an integer between the specified range
#Source: https://ruby-doc.org/core-2.5.1/Regexp.html

def askforcard1(number_of_cards)
    puts "Choose the first card (1-#{number_of_cards})"
    card1 = gets.chomp()
    return card1
end

def askforcard2(number_of_cards)
    puts "Choose a second card between (2-#{number_of_cards}) to match"
    card2 = gets.chomp()
    return card2
end

# def askfornumcard(max)
#     puts "How many cards do you want to play on the 3x3 board [1-9](must be even)"
#     number_of_cards = gets.chomp()
#     return number_of_cards
# end

def test_input1(matches, card1, card2,number_of_cards)
    while matches.include?(card1.to_i) || !(/^[1-#{number_of_cards}]$/).match?(card1)
        if !(/^[1-#{number_of_cards}]$/).match?(card1)
            puts "Please input an integer in the specified range"
        else
            puts "That card is already open"
        end
        card1 = askforcard1(number_of_cards)
    end
    return card1.to_i
end

def test_input2(matches,card1,card2,number_of_cards)
    while matches.include?(card2.to_i) || card1 == card2.to_i || !(/^[1-#{number_of_cards}]$/).match?(card2)
        if !(/^[1-#{number_of_cards}]$/).match?(card2)
            puts "Please input an integer in the specified range"
        else 
            puts "That card is already open"
        end 
        card2 = askforcard2(number_of_cards)
    end
    return card2.to_i
end

# def test_input_card(max,number_of_cards)
#     while !(/^[2-#{max}]$/).match?(number_of_cards.to_s) && !((number_of_cards.to_i)%2 == 0)
#         if !(/^[2-#{max}]$/).match?(number_of_cards) 
#             puts "Please input an integer in the specified range"
#             # if number_of_cards%2 != 0
#             #     puts "Please input an even number"
#             # end
#         end 
#         number_of_cards = askfornumcard(number_of_cards)
#     end
#     return number_of_cards.to_i
# end
# p test_input_card(9,5)