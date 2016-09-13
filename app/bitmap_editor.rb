require_relative 'image_maker'

class BitmapEditor
  
  # hold the pixel map varibles in memory
  def initialize
    @@image ||= 0
  end

  # waits for the user input
  def get_command 
    puts 'type ? for help'
    print "> "
    
    @user_input = gets.chomp
    
    parse_data(@user_input)
  end

  # processes the user input
  def parse_data(user_input)
    command_list = user_input.split(" ")
    
    command = command_list.shift
    # =>  get the firts letter
    
    args = command_list
    # => get the arguments

    run(command, args)
  end

  # select the correct command
  def run(command, args )
    
    case command.nil? || command.upcase
      when '?'
        show_help
      when 'I'
        @@image = create_image(args)
      when 'C'
        clear_table
      when 'L'
        color_pixels(args)
      when 'V'
        vertical_draw(args)
      when 'H'
        horizontal_draw(args)
      when 'S'
        show_image
      when 'X'
        exit_console
      else
        puts 'unrecognised command :('
    end

  end

  private
    
    def create_image(args)
      args.length == 2 ? @image = ImageMaker.new(*args) : show_error(1) 
    end

    def clear_table
      @@image == 0 ? show_error(2) : @@image.clear
    end

    def color_pixels(args)
      @@image == 0 ? show_error(2) : (args.length == 3 ? @@image.colour(*args) : show_error(1))
    end

    def vertical_draw(args)
      @@image == 0 ? show_error(2) : (args.length == 4 ? @@image.set_vertical_color(*args) : show_error(1))
    end

    def horizontal_draw(args)
      @@image == 0 ? show_error(2) : (args.length == 4 ? @@image.set_horizontal_color(*args) : show_error(1))
    end

    def show_image
      @@image.pixel_maps.each do |e|
        puts e.join(' ')
      end
    end

    def exit_console
      puts 'goodbye!'
      return exit 0
    end

    def show_error(numError)
      # display the correct error msg
      error_args = "wrong number of arguments. :["
      error_img  = "create a new image first please. :]"
      msg_error  = numError == 1 ? error_args : error_img

      puts msg_error
    end

    def show_help
      puts "? - Help
            I M N - Create a new M x N image with all pixels coloured white (O).
            C - Clears the table, setting all pixels to white (O).
            L X Y C - Colours the pixel (X,Y) with colour C.
            V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
            H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
            S - Show the contents of the current image
            X - Terminate the session"
    end
end
