require 'pp'

def sum(array)
  result = 0
  array.each do |element|
    result += element
  end
  return result
end

def list_of_names(num)
  names = []
  num.downto(1).each do |decrement|
    name = []
    name << decrement
    if sum(name) == num
      names << name
    else
      remainder = num - sum(name)
      list_of_names(remainder).each do |other_name|
        new_name = name + other_name
        new_name.sort!.reverse!
        unless names.include? new_name
          names << new_name
        end
      end
    end
  end
  return names
end

input = gets.to_i
list = list_of_names(input)
pp list
pp list.length