# require_relative 'lib/game'

# game = Game.new
# game.add_players
# game.start

class Card
    attr_reader :color, :shape, :shading, :number
  
    def initialize(color, shape, shading, number)
      @color = color
      @shape = shape
      @shading = shading
      @number = number
    end
end