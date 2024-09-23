# Nikhil Kumar

require_relative 'card'

class Deck
    NUMBERS = [1, 2, 3]
    COLORS = ['red', 'green', 'purple']
    SHAPES = ['oval', 'squiggle', 'diamond']
    SHADINGS = ['solid', 'striped', 'open']
  
    # create the full deck with all combinations
    def initialize
        @cards = []
        NUMBERS.each do |number|
            COLORS.each do |color|
                SHAPES.each do |shape|
                    SHADINGS.each do |shading|
                        @cards << Card.new(number, color, shape, shading)
                    end
                end
            end
        end
        
        # shuffle the deck
        @cards.shuffle!
    end
  
    # deal the cards
    def deal(num)
        @cards.shift(num)
    end
  
    # find number of cards remaining in the deck
    def remaining_cards
        @cards.length
    end
end