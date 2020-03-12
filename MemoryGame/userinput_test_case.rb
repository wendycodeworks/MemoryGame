def askforcard1()
    puts "Choose the first card (1-9)"
    card1 = gets.chomp()
    return card1
end

def askforcard2()
    puts "Choose a second card between (1-9) to match"
    card2 = gets.chomp()
    return card2
end

def test_input1(matches, card1, card2)
    while matches.include?(card1.to_i) || !(/^[1-9]$/).match?(card1)
        if !(/^[1-9]$/).match?(card1)
            puts "Please input an integer in the specified range"
        else
            puts "That card is already open"
        end
        card1 = askforcard1()
    end
    return card1.to_i
end

def test_input2(matches,card1,card2)
    while matches.include?(card2.to_i) || card1 == card2.to_i || !(/^[1-9]$/).match?(card2)
        if !(/^[1-9]$/).match?(card2)
            puts "Please input an integer in the specified range"
        else 
            puts "That card is already open"
        end 
        card2 = askforcard2()
    end
    return card2.to_i
end