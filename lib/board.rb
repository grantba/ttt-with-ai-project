class Board

    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(cell_number)
        space = cell_number.to_i - 1
        cells[space]
    end

    def update(position_desired, player_object)
        i = position_desired.to_i - 1
        cells[i] = player_object.token
    end

    def full?
        if cells.index(" ")
            false
        else
            true
        end
    end

    def turn_count
        cells.count {|space| space == "X" || space == "O"}
    end

    def taken?(index_number)
        i = index_number.to_i - 1
        if cells[i] == " "
            false
        else
            true
        end
    end
    
    def valid_move?(index_number)
        i = index_number.to_i
        if i >=1 && i <=9
            if taken?(i) == false
                true
            else
                false
            end
        end
    end

end