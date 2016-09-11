require "../app/bitmap_editor"

describe 'BitMap' do

	# test command line

	before do
    @image = BitmapEditor.new
  end
	
	describe 'new image' do
		
		it "It allows to create a new instance" do
			@image.should be_an_instance_of BitmapEditor
		end
	end

end