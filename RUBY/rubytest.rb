

# For loops in arrays
puts "For loops in array"
arr = []
arr.push(2)
arr.push(3)
arr.push(4)

for a in arr do
    print a.to_s + "\t"
end



#Largest Common Factor


def GCD(a, b)
    if b == 0
        return a
    end
    return GCD(b, a % b)
end


#Least Common Mutiple

def LCM(a, b)
    return a * b / GCD(a, b)
end
a = 4
b = 6
print "Least Common Mutiple of #{a} and #{b} is " + LCM(a, b).to_s + "\n"

############## Exception ####################
puts "Handle exception divided by zero"
begin
    10 / 0
rescue => exception
    puts exception
ensure
    puts "Ahihi"
end

