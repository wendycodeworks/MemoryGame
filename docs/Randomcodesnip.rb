p "Key: #{key}"
p "Backside: #{backside}"
p "Card1: #{card1}"
p "Card2: #{card2}"
p "Matches: #{matches}"
p "Attempts: #{attempt}"



test_loop = 0
init_state(3,backside)
while !backside.empty?
    test_attempt = [[1,2],[3,4]]
    puts "Attempt:  #{attempt.length + 1}"
    puts "Current"
    init_state(3,backside)
    card1 = test_attempt[test_loop][0]
    card2 = test_attempt[test_loop][1]
    p backside
    puts "Loop1"
    firstflip(3,card1,backside)
    puts "Loop2"
    secondflip(3, card1, card2,backside)

    backside = match_condition(card1,card2,backside)
    attempt.push([card1, card2])

    p attempt
    p backside
    if backside.empty?
        win_display()
    else
        puts "Keep Going!"
    end
    test_loop += 1
    puts test_loop
end