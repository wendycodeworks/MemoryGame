def win_display(playagain)
    puts "--------------"
    puts "You Win!"
    puts "--------------"
    puts "Would you like to play another matching game? (y/n)"
    ans = gets.chomp
    while !(/[yn]/).match?(ans)
        puts "Incorrect input, please input either (y/n)"
        ans = gets.chomp
    end
    if ans == "y"
        playagain = true
    else
        playagain = false
    end
    return playagain
end
