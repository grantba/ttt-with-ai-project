require 'pry'

class Game

    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        if @board.turn_count.even? 
            player_1
        else
            player_2
        end
    end

    def won?
        @winner = WIN_COMBINATIONS.detect do |winner|
            @board.cells[winner[0]] ==  "X" && @board.cells[winner[1]] == "X" && @board.cells[winner[2]] == "X" ||
            @board.cells[winner[0]] == "O" && @board.cells[winner[1]] == "O" && @board.cells[winner[2]] == "O"
        end
    end

    def draw?
        if !won? && @board.full?
            true
        else
            false
        end
    end

    def over?
        if won? || draw? 
            true
        else
            false
        end
    end

    def winner 
        if !won?
            return nil
        else
            @board.cells[@winner[0]]
        end
    end

    def play 
        until over? == true
            turn
        end

        if won?
            puts "Congratulations #{self.winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

    def turn
        puts "The current gameboard looks like this."
        @board.display
        puts "It's #{self.current_player.token}'s turn."
        selection = self.current_player.move(@board)
        if @board.valid_move?(selection)
            @board.update(selection, current_player)
        else
            puts "invalid"
            self.turn
        end
    end

end