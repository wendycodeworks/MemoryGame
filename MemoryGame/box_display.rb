def printxx()
    for i in 0..2
        printline()
    end
    puts "---"
end

def prettybox(dimension)
    for i in 0..7*dimension-1
        print "-"
    end
    puts " "
end

def win_display()
    puts "--------------"
    puts "You Win!"
    puts "--------------"
end

def printcount(count)
    print "-XX".colorize(:red)
    print count
    print "XX".colorize(:red)
end

def printkeycount(key,count)
    print "-XX".colorize(:red)
    print key[count]
    print "XX".colorize(:red)
end

def printline
    print "-XXXXX".colorize(:red)
end
