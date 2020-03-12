require "tty-box"
require "tty-prompt"

def win_display(playagain)
    prompt = TTY::Prompt.new
    box = TTY::Box.frame(width: 30, height: 10, align: :center, padding: 3) do
        "Congragulations! You Win!"
    end
    print box
    play = prompt.select("Do you want to play again?", %w(Yes No))
    if play == "Yes"
        playagain = true
    else
        playagain = false
    end
    return playagain
end
