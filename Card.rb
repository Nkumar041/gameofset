# Create a card class
class Card
    attr_reader :number, :color, :shape, :shading
  
    # Initialize the 4 attributes
    def initialize(number, color, shape, shading)
        @number = number
        @color = color
        @shape = shape
        @shading = shading
    end
  
    # converts all card values into a string
    def to_s
        "#{number} #{color} #{shape} #{shading}"
    end
end