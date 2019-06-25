

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


########################### Source Layout ###########################
a = 1
b = 2; c = 3
d = 4 + 5 +
    6 + 7  # no '\' needed
puts d
e = 8 + 9 \
    + 10  #'\' needed

#Begin and end blocks

#################Objects and Classes#####################

# class Test
#     def one()
#         @var = 99
#         two()
#     end

#     def two()
#         puts @var
#     end
# end

# t = Test.new
# t.one

# class Test
#     puts "In the definition of class Test"
#     puts "self = #{self}"
#     puts "Class of self = #{self.class}"
# end



# class Test
#     @var = 99
#     def self.value_of_var()
#         return @var;
#     end
# end

# puts Test.value_of_var
    
# end

####################Singleton##########################
# animal = "cat"
# puts animal.upcase()

# def animal.speak()
#     puts "The #{self} says miaow"
# end
# animal.speak()
# puts animal.upcase()

# class Dave
#     def self.class_method_one
#         puts "Class method one"
#     end

#     def Dave.class_method_two
#         puts "Class method two"
#     end
# end

# Dave.class_method_one
# Dave.class_method_two


# class Test
#     @var = 99
#     def self.var 
#         @var 
#     end

#     def self.var=(value)
#         @var = value 
#     end
# end

# puts "Original value = #{Test.var}"
# Test.var = "cat"
# puts "New value = #{Test.var}"


# animal = "dog"
# def animal.speak
#     puts "The #{self} says WOOF!"
# end

# singleton = class << animal
#     def lie
#         puts "The #{self} lies down"
#     end
#     self #return singleton class object
# end

# animal.speak;
# animal.lie

# puts "Singleton class object is #{singleton}"
# puts "It defines methods #{singleton.instance_methods - 'cat'.methods}"


# class Test
#     @var = 99
#     class << self
#         attr_accessor :var
#     end 
# end

# puts "Original value = #{Test.var}"
# Test.var = "cat"
# puts "New value = #{Test.var}"

# m = Test.new

################# Inheritance and Visibility ################
class Base 
    def a_method
        puts "Got here"
    end
    private :a_method
end 

class Derived1 < Base 
    public :a_method
end 

class Derived2 < Base
end