class Rectangle 
  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
  end
end

class Rover

  def initialize(x, y, direction, orders)
  
    @x = x
    @y = y
    @direction = direction
    @orders = orders
  
  end

  def move

    case @direction
      when "N"
        @y += 1
      when "E"
        @x += 1
      when "S"
        @y -= 1
      when "W"
        @x -= 1
    end

  end

  def rotate(directive)
  
    array_of_cardinals = ["N", "E", "S", "W"]

    current_position = array_of_cardinals.index(@direction)

    if directive == "L"

      current_position -= 1

    else
      current_position += 1
      current_position = 0 if current_position > 3
    end
    
    @direction = array_of_cardinals[current_position]
  
  end

  def get_new_position
    
    @orders.each_char do |x|
      if x == "L" || x == "R"
        rotate(x)
      else
        move
      end
    end
  
  puts "#{@x} #{@y} " + @direction

  end

end

rectangle_1 = Rectangle.new(5, 5)
Rover.new(1, 2, "N", "LMLMLMLMM").get_new_position
Rover.new(3, 3, "E", "MMRMMRMRRM").get_new_position
