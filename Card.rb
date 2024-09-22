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
  
    # to_string method to get all card information in one piece of data
    def to_string
        "#{number} #{color} #{shape} #{shading}"
    end
end