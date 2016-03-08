require 'pry'
module Check
  def check_all(configuration, bomb)
    numbers = {'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'zero' => 0, }
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |check|
      10.times {puts check}
      check = check.split(" ")
      case check[0]
      when "batteries"
        bomb.battery_count = numbers[check[1]]
        Speech.new("#{numbers[check[1]]} battery").speak
      when "digit"
        digit = numbers[check[1]]
        if digit % 2 == 0
          bomb.final_digit_odd = false
          Speech.new("Even").speak
        else
          bomb.final_digit_odd = true
          Speech.new("Odd").speak        
        end
      when "vowel"
        if check[1] == "yes"
          bomb.vowel = true
          Speech.new("Vowel").speak
        else
          bomb.vowel = false
          Speech.new("No vowel").speak
        end
      when "car"
        if check[1] == "yes"
          bomb.indicator_car = true
          Speech.new("Car").speak
        else
          bomb.indicator_car = false
          Speech.new("No car").speak
        end
      when "freak"
        if check[1] == "yes"
          bomb.indicator_frk = true
          Speech.new("Freak").speak
        else
          bomb.indicator_frk = false
          Speech.new("No freak").speak
        end
      when "parallel"
        if check.last == "yes"
          bomb.parallel_port = true
          Speech.new("Parallel port").speak
        else
          bomb.parallel_port = false
          Speech.new("No parallel port").speak
        end
      end
      if bomb.battery_count == nil || bomb.vowel == nil || bomb.final_digit_odd == nil || bomb.indicator_frk == nil || bomb.indicator_car == nil || bomb.parallel_port == nil
        return check_all(configuration, bomb)
      else
        return "done" # "Batteries: #{bomb.battery_count}, Vowel: #{bomb.vowel}, Final Digit Odd: #{bomb.final_digit_odd}, Freak: #{bomb.indicator_frk}, Car: #{bomb.indicator_car}, Parallel port: #{bomb.parallel_port}"
      end
    end
  end
end