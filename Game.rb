class Game
    def initialize
        @deck = Deck.new
        @board = []
        @score = 0
        @sets_found = 0
    end
  
    def start
        puts "Welcome to the game of Set!"
        deal_initial_cards
        game_loop
    end
  
    def deal_initial_cards
        @board = @deck.deal(12)
        display_board
    end
  
    def display_board
        puts "\nCurrent board:"
        @board.each_with_index do |card, index|
            puts "#{index + 1}: #{card}"
        end
    end
  
    def game_loop
        loop do
            puts "\nIdentify a set by entering the card numbers separated by spaces (or type 'exit' to quit):"
            input = gets.chomp
    
            if input.downcase == 'exit'
                puts "Thanks for playing! Final score: #{@score}"
                break
            end
    
            selected_cards = input.split.map { |i| @board[i.to_i - 1] }
            if valid_set?(selected_cards)
                @sets_found += 1
                @score += 1
                puts "Correct set! Your score: #{@score}"
                replace_cards(selected_cards)
                display_board
            else
                puts "Incorrect set. Try again."
            end
    
            if @deck.remaining_cards == 0 && !set_available?
                puts "Game over! No more sets available. Final score: #{@score}"
                break
            end
        end
    end
  
    def valid_set?(cards)
        return false unless cards.size == 3
        attributes = [:number, :color, :shape, :shading]
  
        attributes.all? do |attr|
            values = cards.map { |card| card.send(attr) }
            values.uniq.size == 1 || values.uniq.size == 3
        end
    end
  
    def replace_cards(cards)
        cards.each do |card|
            @board[@board.index(card)] = @deck.deal(1).first
        end
    end
  
    def set_available?
        @board.combination(3).any? { |cards| valid_set?(cards) }
    end
end