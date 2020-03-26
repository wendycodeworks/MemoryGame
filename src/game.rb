require_relative "box_display"
require_relative "userinput_test_case"
require_relative "display_card_status"
require_relative "random_hash"
require_relative "match_case.rb"
require_relative "win_message.rb"
require "colorize"
require "tty-box"
require "tty-prompt"
require 'progress_bar'

# Initialize variables
#Source: https://github.com/paul/progress_bar
#Source: https://github.com/piotrmurach/tty-prompt

def memorygame()
playagain = true
prompt = TTY::Prompt.new

if ARGV[0] == "-h"
    puts "# Help File

    ## There are two ways to install the application into your computer:
    ### 1) GitHub
    1) Open VSCode and open a terminal.
    2) Initiate git with git init in the folder you want
    3) Clone the reprository with git clone https://github.com/wcheng8/MemoryGame.git 
    4) Run ruby game.rb in the /TerminalApp/MemoryGame directory
    ### 2) Download a ZipFile
    1) Go to the repository https://github.com/wcheng8/MemoryGame
    2) Click on clone or download repository
    3) Download a zip file of the repository
    4) Open VSCode
    5) Change Directory to where you saved the file and in the /Terminal/MemoryGame folder on the terminal run: ruby game.ruby
    
    ## System/Hardware Requirements
    - Latest version of Ruby
    - Terminal
    
    ## Dependencies
    All files in /TerminalApp/MemoryGame
    - box_display.rb
    - display_card_status.rb
    - match_case.rb
    - random_hash.rb
    - userinput_test_case.rb
    - win_message.rb
    
    ## (NOTE: Install gems before running the code to ensure you have the gems)
    Gems installed include
    - colorize
    - tty-box
    - tty-prompt
    - progress_bar
    
    Install gems in prompt using gem install 'colorize', gem install tty-box..."
    prompt.keypress("Press a key to exit")

end

while playagain
    system "clear"
    print TTY::Box.frame "Welcome to the Memory Game!"

    matches = []
    matches_prev = []
    attempt = []
    number_of_cards = 8
    max = 9
    # number_of_cards = askfornumcard(max)
    # number_of_cards = test_input_card(max,number_of_cards)
    backside = rand_alph(number_of_cards)
    key = backside.clone()
    progressbar = ProgressBar.new(key.size)
    while !backside.empty?
        card1 = -1
        card2 = -1

        print progressbar
        init_state(3,backside,matches,key)
        card1 = askforcard1(number_of_cards)
        card1 = test_input1(matches,card1,card2,number_of_cards)
        firstflip(3,card1,backside,matches,key)
        card2 = askforcard2(number_of_cards)
        card2 = test_input2(matches,card1,card2,number_of_cards)
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
back_to_main()
end