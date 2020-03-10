def printxx()
    print "-XXXXX"
    print "-XXXXX"
    print "-XXXXX"
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