require "../app/image_maker"

describe 'ImageMaker' do

	# create a new the image 
	before do
		@with = 5
    @height = 6
    @image = ImageMaker.new(@with, @height)
  end
	
	describe 'create new :Bitmap' do
		
		it "It has a correct image size" do
			# set the elements
	    expect(@image.with).to eql(5)
	    expect(@image.height).to eql(6)

	    # total of elements inside the array
	    expect(@image.with * @image.height).to eql(30)
  	end

  	it "It has the correct initial color 'O'" do
  		@image.draw_image[0].each do |x|
  			 expect(x).to eq("O")
  		end
	  end

	  it "colours the firts pixel equal to A" do
	    bitmap = "AOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
	    @image.colour(1,1,"A")

	    # change the firts element 
	    expect(@image.pixel_maps.join()).to eq bitmap
	  end

	  it "draw the vertical pixel image with the color G" do
	    bitmap = "OOOOOOOOOOOGOOOOGOOOOOOOOOOOOO"
	    @image.set_vertical_color(2,3,4,"G")

	    # test vertical draw
	    expect(@image.pixel_maps.join()).to eq bitmap
	  end

	  it "draw the horizontal pixel image with the color F" do
	    bitmap = "OOOOOOOOOOOOOOOOFFOOOOOOOOOOOO"
	    @image.set_horizontal_color(2,3,4,"F")

	    # test horizontal draw
	    expect(@image.pixel_maps.join()).to eq bitmap
	  end

	  it "clear the modify image" do
	    bitmap = "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
	    # change the image
	    @image.colour(1,1,"A")

	    # clear the image to its default value
	    expect(@image.clear.join()).to eq bitmap
	  end

	  it "It has arguments out the image size" do
	  	bitmap = "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
	    # if the arguments are out of the image 
	  	@image.set_horizontal_color(2,9,4,"F")

	  	# the image is not changed
	    expect(@image.pixel_maps.join()).to eq bitmap
	  end
	end

end