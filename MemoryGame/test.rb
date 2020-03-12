# alph_hash = {1=>"A",2=>"A",3=>"B",4=>"B",5=>"C",6=>"C",7=>"D",8=>"D"}
alph_hash = {1=>"A",2=>"A",3=>"B",4=>"B",5=>"C",6=>"C"}

rand_hash = {}
rand_arr = []
charset = Array("A".."Z")
for i in 1..8
    temp = rand(1..8)
    while rand_arr.include?(temp)
        temp = rand(1..8)
    end
    rand_arr.push(temp)
end
p rand_arr

for i in 0..rand_arr.length-1
    if rand_arr[i] > 4
        rand_arr[i] = rand_arr[i]%4 + 1
    end
end
p rand_arr
p charset[rand_arr[0]]

for i in 1..rand_arr.length
    rand_hash[i] = charset[rand_arr[i-1]]
end
p rand_hash

# p charset_sub