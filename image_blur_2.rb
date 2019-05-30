class Image

  def initialize (image)
    @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def manhattan (wrap=1)
    wrap.times do
      blur
    end 
    output_image
  end


  def blur
    positions = []
 
    @image.each_with_index do |row, index|
      row.each_with_index do |number, slot| 
        if number == 1
         positions << [index, slot] 
    
        end
      end
    end
        
    positions.each do |position|
     if position[1] < @image[0].length - 1
       @image[position[0]][position[1]+1] = 1
      end
     if position[1] > 0
      @image[position[0]][position[1]-1] = 1
     end
     if position[0] + 1 < @image.length - 1
      @image[position[0]+1][position[1]] = 1
     end
     if position[0] > 0
      @image[position[0]-1][position[1]] = 1
     end    
    end
    end
end


image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0]
])


image.manhattan(2)
