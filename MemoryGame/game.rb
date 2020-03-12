require_relative "box_display"
require_relative "userinput_test_case"
require_relative "display_card_status"
require_relative "random_hash"
require_relative "match_case.rb"
require_relative "cardnum.rb"
require_relative "win_message.rb"
require "colorize"
require "tty-box"
require "tty-prompt"
require "tty-spinner"
require 'progress_bar'

# Initialize variables
number_of_card = 3**2
number_on_card = []
number_on_card = numbersoncard(number_of_card, number_on_card)
playagain = true
prompt = TTY::Prompt.new
spinner = TTY::Spinner.new("[:spinner] Selecting Cards ...", format: :pulse_2)

while playagain
    system "clear"
    print TTY::Box.frame "Welcome to the Memory Game!"
    
    matches = []
    attempt = []
    backside = rand_alph()
    key = backside.clone()
    progressbar = ProgressBar.new(key.size)
    while !backside.empty?
        card1 = -1
        card2 = -1
        # p "Key: #{key}"
        # p "Backside: #{backside}"
        # p "Card1: #{card1}"
        # p "Card2: #{card2}"
        # p "Matches: #{matches}"
        # p "Attempts: #{attempt}"
        print progressbar
        init_state(3,backside,matches,key)
        card1 = askforcard1()
        card1 = test_input1(matches,card1,card2)
        firstflip(3,card1,backside,matches,key)
        # p "Key: #{key}"
        # p "Backside: #{backside}"
        # p "Card1: #{card1}"
        # p "Card2: #{card2}"
        # p "Matches: #{matches}"
        # p "Attempts: #{attempt}"
        card2 = askforcard2()
        card2 = test_input2(matches,card1,card2)
        secondflip(3, card1, card2,backside,matches,key)
        # p "Key: #{key}"
        # p "Backside: #{backside}"
        # p "Card1: #{card1}"
        # p "Card2: #{card2}"
        # p "Matches: #{matches}"
        # p "Attempts: #{attempt}"
        backside = match_condition(card1,card2,backside)
        matches = correct_match(card1,card2,backside,matches)
        progressbar.increment! matches.length

        attempt.push([card1, card2])

        if !backside.empty?
            prompt.keypress("You have three seconds to remeber, or press any key to continue :countdown ...", timeout: 3)
        end
        
        if backside.empty?
            prompt.keypress("You made #{attempt.flatten.length} Attempts", timeout: 3)
            system "clear"
            playagain = win_display(playagain)
        else
            puts "Keep Going!"
        end
        system "clear"
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