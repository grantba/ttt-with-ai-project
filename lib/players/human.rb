module Players 
    class Human < Player

        def move(board)
            puts "Where would you like to move on the board?"
            puts "Pick a spot anywhere between 1-9 on the board."
            puts "Enter the corresponding number."
            input = gets.strip
            input
        end

    end
end