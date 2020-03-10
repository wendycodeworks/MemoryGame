# def print_card_back
#     # Inputs a card
#     for i in 0..2
#         puts "-XXXX-"
#     end
#         puts "------"
# end

def game_panel(dimension) #Replace - with space
    # Space between each row of cards
    for i in 0..6*dimension-1
        print "-"
    end
    puts " "
    for i in 0..dimension-1
        # Creates dimension of cards by column
        for i in 0..dimension-1
        # Inputs a card
            for i in 0..2
                print "-XXXX-"
            end
                puts "---"
        end
        # Space between each row of cards
        for i in 0..6*dimension-1
            print "-"
        end
        #Enters new line
        puts " "
    end
end
game_panel(3)
