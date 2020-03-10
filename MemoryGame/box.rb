def printxx()
    print "-XXXXX".colorize(:red)
    print "-XXXXX".colorize(:red)
    print "-XXXXX".colorize(:red)
    puts "---"
end

def game_panel(dimension) 
    prettybox(3)
    count = 1
    #Creates dimension of rows of cards
    for x in 0..dimension-1

       printxx()

        print "-XX#{count}XX"
        count += 1
        print "-XX#{count}XX"
        count += 1
        print "-XX#{count}XX"
        count += 1
        puts "---"

        printxx()
        prettybox(3)
    end
end