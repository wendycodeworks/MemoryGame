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
require 'progress_bar'

# Initialize variables
number_of_card = 3**2
number_on_card = []
number_on_card = numbersoncard(number_of_card, number_on_card)
playagain = true
prompt = TTY::Prompt.new

while playagain
    system "clear"
    print TTY::Box.frame "Welcome to the Memory Game!"
    
    matches = []
    matches_prev = []
    attempt = []
    backside = rand_alph()
    key = backside.clone()
    progressbar = ProgressBar.new(key.size)
    while !backside.empty?
        card1 = -1
        card2 = -1

        print progressbar
        init_state(3,backside,matches,key)
        card1 = askforcard1()
        card1 = test_input1(matches,card1,card2)
        firstflip(3,card1,backside,matches,key)
        card2 = askforcard2()
        card2 = test_input2(matches,card1,card2)
        secondflip(3, card1, card2,backside,matches,key)
        backside = match_condition(card1,card2,backside)
        prev_match = matches.clone
        matches = correct_match(card1,card2,backside,matches)
        if matches != matches_prev
            progressbar.increment! matches.length
        else
            print progressbar
        end 
        # p matches
        attempt.push([card1, card2])

        if !backside.empty?
            prompt.keypress("You have three seconds to remeber, or press any key to continue :countdown ...", timeout: 3)
        end
        
        if backside.empty?
            prompt.keypress("You made #{attempt.flatten.length/2} Attempts", timeout: 3)
            system "clear"
            playagain = win_display(playagain)
        else
            puts "Keep Going!"
        end
        system "clear"
    end
end

