require_relative "box"
require "colorize"

puts "I am red".colorize(:red)
dimension = 3
number_of_card = dimension**2
number_on_card = []
for i in 1..number_of_card
    number_on_card.push(i)
end

def rand_alph()
    alph_hash = {1=>"A",2=>"A",3=>"B",4=>"B",5=>"C",6=>"C",7=>"D",8=>"D",9=>"D"}
    return alph_hash
end

backside = rand_alph()

def prettybox(dimension)
    for i in 0..7*dimension-1
        print "-"
    end
    puts " "
end

# Space between each row of cards
#Make an array of number of cards (1,2,3...9)

def firstflip(dimension, card)
    prettybox(3)
    count = 1
    #Creates dimension of rows of cards
    for x in 0..dimension-1

        printxx()

        if card == count
            print "-XXXXX".colorize(:red)
        else
             print "-XX".colorize(:red)
             print count
             print "XX".colorize(:red)
        end
        count += 1

        if card == count
            print "-XXXXX".colorize(:red)
        else
             print "-XX".colorize(:red)
             print count
             print "XX".colorize(:red)
        end
        count += 1
        
        if card == count
            print "-XXXXX".colorize(:red)
        else
             print "-XX".colorize(:red)
             print count
             print "XX".colorize(:red)
        end
        count += 1
        puts "---"
        
        printxx()
        prettybox(3)
    end
    return card
end

def secondflip(dimension, card, card2)
    # Space between each row of cards
   #Make an array of number of cards (1,2,3...9)
   prettybox(3)
   count = 1

   #Creates dimension of rows of cards
   for x in 0..dimension-1

       printxx()

    
       if card == count || count == card2
           print "-XXXXX".colorize(:red)
       else
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
       end
       count += 1

       if card == count || count == card2
            print "-XXXXX".colorize(:red)
       else
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
       end
       count += 1
       
       if card == count || count == card2
           print "-XXXXX".colorize(:red)
       else
           print "-XX".colorize(:red)
           print count
           print "XX".colorize(:red)
       end
       count += 1
       puts "---"
       
       printxx()
       prettybox(3)

   end
   return card2
end


def match_condition(a,b)
    if a == b
        p "It's a match!!"
        # secondflip(3,9,8)
        return true
    else
        p "Tough Luck try again :("
        # game_panel(3)
        return false
    end
end

# game_panel(3)
a = backside[firstflip(3,1)]
b = backside[secondflip(3,1,2)]
p a
p b
# while !match_condition(a,b)
#     b = backside[secondflip(3,1,2)]
# end


p backside
match_condition(a,b)
# backside.delete(firstflip(3,1))
# backside.delete(secondflip(3,1,2))
p backside


if backside.empty? 
    puts "You Win!"
else
    puts "Keep Going"
end
