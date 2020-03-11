require_relative "box_display"
require "colorize"

# Initialize variables
dimension = 3
number_of_card = dimension**2
number_on_card = []
attempt = []
matches = []
card2 = 0
question_index = [0,1]

for i in 1..number_of_card
    number_on_card.push(i)
end

def rand_alph()
    # alph_hash = {1=>"A",2=>"A",3=>"B",4=>"B",5=>"C",6=>"C",7=>"D",8=>"D"}
    alph_hash = {1=>"A",2=>"A",3=>"B",4=>"B",5=>"C",6=>"C"}
    return alph_hash
end

backside = rand_alph()
key = rand_alph()

def askforcard1()
    puts "Choose the first card (1-9)"
    card1 = gets.chomp()
    return card1
end

def askforcard2()
    puts "Choose a second card between (1-9) to match"
    card2 = gets.chomp()
    return card2.to_i
end


def init_state(dimension, backside,matches,key)
    count = 1
    prettybox(3)
    #Creates dimension of rows of cards
    for x in 0..dimension-1

        printxx()

        if backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
        end
        count += 1

        if  backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)

        end
        count += 1
        
        if backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
     
        end
        count += 1
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

        if card == count
            print "-XX".colorize(:red)
            print backside[count]
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        elsif backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
        end
        count += 1

        if card == count
            print "-XX".colorize(:red)
            print backside[count]
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        elsif backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
            print key[count]
        end


        count += 1
        
        if card == count
            print "-XX".colorize(:red)
            print backside[count]
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        elsif backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
        end

        count += 1
        puts "---"
        
        printxx()
        prettybox(3)
    end
end

def secondflip(dimension, card, card2,backside,matches ,key)
    # Space between each row of cards
   #Make an array of number of cards (1,2,3...9)
   prettybox(3)
   count = 1
   #Creates dimension of rows of cards
   for x in 0..dimension-1

       printxx()
    
        if card == count 
            print "-XX".colorize(:red)
            print backside[card]
            print "XX".colorize(:red)
        elsif card2 == count
            print "-XX".colorize(:red)
            print backside[card2]
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        elsif backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
        end
        # print count

        count += 1

        if card == count
            print "-XX".colorize(:red)
            print backside[card]
            print "XX".colorize(:red)
        elsif card2 == count
            print "-XX".colorize(:red)
            print backside[card2]
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        elsif backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
        end
        # print count


        count += 1
        
        if card == count
            print "-XX".colorize(:red)
            print backside[card]
            print "XX".colorize(:red)
        elsif card2 == count
            print "-XX".colorize(:red)
            print backside[card2]
            print "XX".colorize(:red)
        elsif matches.include?(count)
            print "-XX".colorize(:red)
            print key[count]
            print "XX".colorize(:red)
        elsif backside.key?(count)
            print "-XX".colorize(:red)
            print count
            print "XX".colorize(:red)
        else
            print "-XXXXX".colorize(:red)
        end
        # print count

        count += 1
       puts "---"
       
       printxx()
       prettybox(3)
    end

end


def match_condition(a,b,backside)
    if backside[a] == backside[b]
        p "It's a match!!"
        backside.delete(a)
        backside.delete(b)
        return backside
    else
        p "Tough Luck try again :("
        return backside
    end
end

def correct_match(a,b,backside,correct_match)
    if backside[a] == backside[b]
        correct_match.push(a)
        correct_match.push(b)
        return correct_match
    else
        return correct_match
    end

end

def win_display()
    puts "--------------"
    puts "You Win!"
    puts "--------------"
end

def test_input1(matches, card1, card2)
    while matches.include?(card1) || card1 == card2 || !(/^[1-9]$/).match?(card1)
        if !(/^[1-9]$/).match?(card1)
            puts "Please input an integer in the specified range"
        else
            puts "That card is already open"
        end
        card1 = askforcard1()

    end
    return card1

end

def test_input2(matches,card1,card2)
    while matches.include?(card2) || card1 == card2 || !(/^[1-9]$/).match?(card1)
        if !(/^[1-9]$/).match?(card1)
            puts "Please input an integer in the specified range"
        else 
            puts "That card is already open"
        end 
        card2 = askforcard2()
    end
    return card2
end

while !backside.empty?
    card1 = -1
    card2 = -1
    puts "Attempt:  #{attempt.length + 1}"
    init_state(3,backside,matches,key)
    puts "Matches: #{matches}"
    card1 = askforcard1()
    card1.to_i
    puts "Card1 #{card1}"
    puts matches.include?(card1)



    card1 = test_input1(matches,card1,card2)
    p card1

    p "currKey: #{backside}"
    p "Ans #{key}"
    p "corect match #{matches}" 
    firstflip(3,card1,backside,matches,key)
    card2 = askforcard2()
    card2.to_i
    card2 = test_input2(matches,card1,card2)

    p "Ans #{key}"
    secondflip(3, card1, card2,backside,matches,key)
    p "corect match #{matches}"
    backside = match_condition(card1,card2,backside)
    matches = correct_match(card1,card2,backside,matches)
    p "corect match #{matches}" 
    attempt.push([card1, card2])

    p "Attempts: #{attempt}"
    p "Attempts: #{attempt.flatten}"

    p "Key: #{backside}"
    if backside.empty? 
        win_display()
    else
        puts "Keep Going!"
    end
end

test_loop = 0
# init_state(3,backside)
# while !backside.empty?
#     test_attempt = [[1,2],[3,4]]
#     puts "Attempt:  #{attempt.length + 1}"
#     puts "Current"
#     init_state(3,backside)
#     card1 = test_attempt[test_loop][0]
#     card2 = test_attempt[test_loop][1]
#     p backside
#     puts "Loop1"
#     firstflip(3,card1,backside)
#     puts "Loop2"
#     secondflip(3, card1, card2,backside)

#     backside = match_condition(card1,card2,backside)
#     attempt.push([card1, card2])

#     p attempt
#     p backside
#     if backside.empty? 
#         win_display()
#     else
#         puts "Keep Going!"
#     end
#     test_loop += 1
#     puts test_loop
# end