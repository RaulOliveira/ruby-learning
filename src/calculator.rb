def calculateFactorial(number=0)
    return number<=1 ? 1 : number * calculateFactorial(number - 1)
end

OPERATIONS = { 
    1 => 'Addition', 
    2 => 'Subtraction', 
    3 => 'Multiplication', 
    4 => 'Division', 
    5 => 'Potentiation',
    6 => 'Factorial'
}

puts "\n~~~~ Operations Options ~~~~"
OPERATIONS.each_with_index do |(key, value), index|
    puts "#{key}: #{value}"
end
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
puts "Info: In case of potentiation, the first number will be the base and the second number will be the exponent\n\n"

begin
    chosenOperation = nil
    firstNumber = nil
    secondNumber = nil

    puts "1) Input the number of operation: Ex.: 1/2/3 ..."
    chosenOperation = STDIN.gets.chomp.to_i  

    if(!OPERATIONS.key?(chosenOperation))
        raise 'Your chosen operation is invalid!'
    end

    puts "2) Input number:"
    firstNumber = STDIN.gets.chomp.to_f

    if (chosenOperation != 6)
        puts "3) Input other number:"
        secondNumber = STDIN.gets.chomp.to_f
    end

    result = nil
    case chosenOperation
        when 1
            result = firstNumber + secondNumber 
        when 2
            result = firstNumber - secondNumber
        when 3
            result = firstNumber * secondNumber
        when 4
            if(secondNumber == 0)
                raise 'It is not possible to divide by zero!'
            end
            result = firstNumber / secondNumber
        when 5
            result = firstNumber ** secondNumber
        when 6
            result = calculateFactorial(firstNumber)
    end

    puts result

rescue => exception
    puts exception.message
end