require 'byebug'
class Employee
  attr_reader :salary
    def initialize(name, title, salary, boss)
        @name=name
        @title=title
        @salary=salary
        @boss=boss
    end

    def bonus(multiplier)
        bonus= @salary * multiplier
    end
end

class Manager < Employee
    #subordinates must be an array 
    def initialize(name, title, salary, boss, subordinates)
        super(name, title, salary, boss)
        @subordinates=subordinates
    end
    def bonus(multiplier)
        #debugger
        total_salary = 0
        @subordinates.each do |sub|
          if sub.is_a?(Manager)
            total_salary += sub.bonus(multiplier) + sub.salary * multiplier
          else
            total_salary += sub.salary * multiplier
          end
        end
        total_salary
    end
end

shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
david = Employee.new('David', 'TA', 10000, 'Darren')
darren= Manager.new('Darren', 'TA Manager', 78000, 'Ned',[david, shawna])
ned= Manager.new('Ned', 'Founder', 1000000, nil, [darren])

p ned.bonus(5) #500,000
p darren.bonus(4) #88,000
p david.bonus(3) #30,000