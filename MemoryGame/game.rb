require_relative "box_display"
require_relative "userinput_test_case"
require_relative "display_card_status"
require_relative "random_hash"
require_relative "match_case.rb"
require_relative "cardnum.rb"
require "colorize"
require "tty-box"

# Initialize variables
dimension = 3
number_of_card = dimension**2
number_on_card = []
attempt = []
matches = []
card2 = 0
question_index = [0,1]
number_on_card = numbersoncard(number_of_card, number_on_card)
backside = rand_alph()
key = rand_alph()

print TTY::Box.frame "Welcome to the Memory Game!"
while !backside.empty?
    card1 = -1
    card2 = -1
    init_state(3,backside,matches,key)
    card1 = askforcard1()
    card1 = test_input1(matches,card1,card2)
    firstflip(3,card1,backside,matches,key)
    card2 = askforcard2()
    card2 = test_input2(matches,card1,card2)
    secondflip(3, card1, card2,backside,matches,key)
    backside = match_condition(card1,card2,backside)
    matches = correct_match(card1,card2,backside,matches)
    attempt.push([card1, card2])
    if backside.empty? 
        win_display()
    else
        puts "Keep Going!"
    end
end

# test_loop = 0
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