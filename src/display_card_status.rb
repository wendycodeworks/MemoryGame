#Flip the first card and flip the second card. If either card1 or card2 is a existing match, keep it flipped, if not keep it unflipped.

def init_state(dimension, backside,matches,key)
    count = 1
    prettybox(3)
    #Creates 3 rows of cards
    for x in 0..dimension-1
        printxx()
        #Creates the middle row of each card, check if cards are in existing match
        for y in 0..dimension-1
            if backside.key?(count)
                printcount(count)
            elsif matches.include?(count)
                printkeycount(key,count)
            else
                printline()
            end
            count += 1
        end
        puts "---"
        printxx()
        prettybox(3)
    end
end

def firstflip(dimension, card, backside, matches,key)
    count = 1
    prettybox(3)
    #Creates 3 rows of cards
    for x in 0..dimension-1
        printxx()
        #Creates the middle row of each card, check if cards are in existing match and if card is selected
        for y in 0..dimension-1
            if card == count || matches.include?(count)
                printkeycount(key,count)
            elsif backside.key?(count)
                printcount(count)
            else
                printline()
            end
        count += 1
        end
        puts "---"
        printxx()
        prettybox(3)
    end
end

def secondflip(dimension, card, card2,backside,matches ,key)
   prettybox(3)
    #Creates 3 rows of cards
   count = 1
   for x in 0..dimension-1
       printxx()
        #Creates the middle row of each card, check if cards are in existing match and if card is selected or card2 is the same as card1
        for y in 0..dimension-1 
        if card == count || card2 == count|| matches.include?(count)
            printkeycount(key,count)
        elsif backside.key?(count)
            printcount(count)
        else
           printline()
        end
        count += 1
        end
        puts "---"
       printxx()
       prettybox(3)
    end

end