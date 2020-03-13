#See if the cards that are flipped are a match. Backside is a key that stores the matches and removes if it is right.

#Check if card matches and modifies the backside key and remove it from backside key
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

#Check if card matches and modifies the backside key and returns correct match
def correct_match(a,b,backside,correct_match)
    if backside[a] == backside[b]
        correct_match.push(a)
        correct_match.push(b)
        return correct_match
    else
        return correct_match
    end
end
