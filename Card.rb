require 'colorize'

class Card
    attr_reader :number, :color, :shape, :shading
  
    # initialize the 4 attributes
    def initialize(number, color, shape, shading)
        @number = number
        @color = color
        @shape = shape
        @shading = shading
    end
  
    # converts all card values into a string. do some nice formatting here
    def to_s
        colorized_color = case @color
                          when 'red' then 'red'.colorize(:red)
                          when 'green' then 'green'.colorize(:green)
                          when 'purple' then 'purple'.colorize(:magenta)
                          end
    
        shape_symbol = case @shape
                       when 'oval' then '●'
                       when 'squiggle' then '~'
                       when 'diamond' then '♦'
                       end
    
        symbol_and_shading = case @shading
                        when 'solid' then shape_symbol * @number + ' (solid)'
                        when 'striped' then shape_symbol * @number + ' (striped)'
                        when 'open' then shape_symbol * @number + ' (open)'
                        end
    
        "#{colorized_color} #{symbol_and_shading}"
    end
end