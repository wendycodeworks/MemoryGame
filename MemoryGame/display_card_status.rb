def init_state(dimension, backside,matches,key)
    count = 1
    prettybox(3)
    #Creates dimension of rows of cards
    for x in 0..dimension-1
        printxx()
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
    #Creates dimension of rows of cards
    for x in 0..dimension-1
        printxx()
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
   count = 1
   for x in 0..dimension-1
       printxx()
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