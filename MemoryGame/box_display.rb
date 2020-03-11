def printxx()
    print "-XXXXX".colorize(:red)
    print "-XXXXX".colorize(:red)
    print "-XXXXX".colorize(:red)
    puts "---"
end

def prettybox(dimension)
    for i in 0..7*dimension-1
        print "-"
    end
    puts " "
end

