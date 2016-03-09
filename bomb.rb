class Bomb

  attr_accessor :vowel
  attr_accessor :final_digit_odd
  attr_accessor :battery_count
  attr_accessor :indicator_car
  attr_accessor :indicator_frk
  attr_accessor :parallel_port
  attr_accessor :strikes
  attr_accessor :memory_round
  attr_accessor :memory_positions
  attr_accessor :memory_labels
  attr_accessor :wire_sequences_red_count
  attr_accessor :wire_sequences_blue_count
  attr_accessor :wire_sequences_black_count
  attr_accessor :password_columns

  def initialize
    @vowel = nil
    @final_digit_odd = nil
    @battery_count = nil
    @indicator_car = nil
    @indicator_frk = nil
    @parallel_port = nil
    @strikes = 0
    @memory_round = 1
    @memory_positions = {}
    @memory_labels = {}
    @wire_sequences_black_count = 0
    @wire_sequences_blue_count = 0
    @wire_sequences_red_count = 0
    @password_columns = { 1=>[], 2=>[], 3=>[], 4=>[], 5=>[] }
  end

  def vowel_check(response)
    puts "Vowel?"
    if @vowel == nil
      if response == "yes"
        @vowel = true
      elsif response == "no"
        @vowel = false
      end
    end
  end

  def final_digit_check
    puts "Final digit?"
    if @final_digit_odd == nil
      if gets.chomp.to_i % 2 == 0
        @final_digit_odd = false
      else
        @final_digit_odd = true
      end
    end
  end

  def batteries_check
    puts "No. of batteries?"
    if @battery_count == nil
      puts "How many batteries are on the bomb?"
      @battery_count = gets.chomp.to_i
    end
  end

  def indicator_car_check
    if @indicator_car == nil
      puts "Is there a lit CAR indicator? (y/n)"
      response = gets.chomp
      if response == "y"
        @indicator_car = true
      elsif response == "n"
        @indicator_car = false
      else
        puts "Invalid input."
        indicator_car_check
      end
    end
  end

  def indicator_frk_check
    if @indicator_frk == nil
      puts "Is there a lit FRK indicator? (y/n)"
      response = gets.chomp
      if response == "y"
        @indicator_frk = true
      elsif response == "n"
        @indicator_frk = false
      else
        puts "Invalid input."
        indicator_frk_check
      end
    end
  end

  def parallel_port_check
    if @parallel_port == nil
      puts "Is there a parallel port on the bomb? (y/n)"
      response = gets.chomp
      if response == "y"
        @parallel_port = true
      elsif response == "n"
        @parallel_port = false
      else
        puts "Invalid input."
        parallel_port_check
      end
    end
  end

  def strike_added?(text_input)
    if text_input == 'X'
      @strikes += 1
      puts "STRIKE ADDED. STRIKES: " + @strikes.to_s
      sleep(1)
      return true
    else
      return false
    end
  end

  def back_to_menu
    puts "Press enter to return to menu."
    if gets.chomp == ""
      load('./menu.rb')
    else
      back_to_menu
    end
  end

end
