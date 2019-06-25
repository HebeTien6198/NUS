$globalVariable = 0

class Person
    
    @@numOfPerson = 0
    def initialize(name, age, ismale)
        @name = name
        @age = age
        @ismale = ismale ? "Male"  : "Female"
        @@numOfPerson += 1
        $globalVariable += 2
    end

    protected
    def info()
        puts "Name #{@name}"
        puts "Age #{@age}"
        puts "Gender #{@ismale}"
    end 

    public
    def numOfPerson() 
        return @@numOfPerson
    end
        
end

class Student < Person
    attr_reader :role
    @@numOfStudent = 0
    def initialize(name, age, ismale)
        super(name, age, ismale)
        @role = "Student"
        @@numOfStudent += 1;
        $globalVariable += 4;
    end

    def info()
        puts numOfPerson()
        puts "Role #{@role}"
    end



    def numOfStudent()
        return @@numOfStudent
    end
end



manh = Student.new("manh", "20", true)

puts "Access father's atribue"
puts manh.numOfPerson()

manh.info()

puts $globalVariable


a = 18
a >= 18 and puts "ccccc"

p = {
    age: 21
}
puts p[:age]