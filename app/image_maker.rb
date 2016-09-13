class ImageMaker
	# hold the varibles
  attr_accessor :with, :height, :pixel_maps

  # If we don't specify the size, start with 0
  def initialize(with = 0, height = 0)
    @with = with.to_i
    @height = height.to_i

    draw_image
  end

  # create a new image
  def draw_image
    @pixel_maps = (1..@height).map{ (1..@with).map{"O"} }

    # show the preview of the image
    @pixel_maps.each do |e|
    	puts e.join(' ')
    end
  end

  # set a color
  def colour(*args)
  	x = (args[0].to_i - 1)
  	y = (args[1].to_i - 1)

  	color = args[2] ||= "C"

  	position = (args[0].to_i + args[1].to_i)
  	
  	total_pixels = @with * @height

  	# find the item by its coordinates 
  	if position > total_pixels
  		puts "wrong move try again! :]"
  	else
  		@pixel_maps[y][x] = color.upcase 
  	end
  end

  # clear the image
  def clear
  	@pixel_maps.clear
  	draw_image
  end

  def set_vertical_color(*args)
  	x  = (args[0].to_i - 1)
    # => position
  	
    y1 = (args[1].to_i - 1)
    # => color start

  	y2 = (args[2].to_i - 1)
    # => color end

  	color = args[3] ||= "C"

  	# set the color
  	(0..@height).each_with_index do |row, i|
  		if i >= y1 && i <= y2
  			@pixel_maps[row][x] = color.upcase
  		end
  	end
  end

  def set_horizontal_color(*args)	
    x1 = (args[0].to_i - 1)
  	# => color start
    
    x2 = (args[1].to_i - 1)
    # =>  color end

  	y = (args[2].to_i - 1)
    # => row

  	color = args[3] ||= "C"

  	# set the color
  	(0..@with).each_with_index do |col, i|
  		if i >= x1 && i <= x2
  			@pixel_maps[y][col] = color.upcase
  		end
  	end 
  end

end