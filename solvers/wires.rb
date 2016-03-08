module Wires
  def solve_wires(configuration, bomb)
    Speech.new("wires go").speak
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |wires|
      puts wires
      wires = wires.split(" ")
      wires.delete("wire")
      Speech.new(wires.join(" ")).speak
      case wires.length
      when 3
        if wires.include?("red") == false
          return "CUT THE SECOND WIRE"
        elsif wires.last == "white"
          return "CUT THE LAST WIRE"
        elsif wires.count("blue") > 1
          return "CUT THE LAST BLUE WIRE"
        else
          return "CUT THE LAST WIRE"
        end
      when 4
        bomb.final_digit_check
        if wires.count("red") > 1 && bomb.final_digit_odd == true
          return "CUT THE LAST WIRE"
        elsif wires.last == "yellow" && wires.count("red") == 0
          return "CUT THE FIRST WIRE"
        elsif wires.count("blue") == 1
          return "CUT THE FIRST WIRE"
        elsif wires.count("yellow") > 1
          return "CUT THE LAST WIRE"
        else
          return "CUT THE SECOND WIRE"
        end
      when 5
        bomb.final_digit_check
        if wires.last == "k" && bomb.final_digit_odd == true
          return "CUT THE FOURTH WIRE"
        elsif wires.count("red") == 1 && wires.count("y") > 1
          return "CUT THE FIRST WIRE"
        elsif wires.count("black") == 0
          return "CUT THE SECOND WIRE"
        else
          return "CUT THE FIRST WIRE"
        end
      when 6
        bomb.final_digit_check
        if wires.count("yellow") == 0 && bomb.final_digit_odd == true
          return "CUT THE THIRD WIRE"
        elsif wires.count("yellow") == 1 && wires.count("yellow") > 1
          return "CUT THE FOURTH WIRE"
        elsif wires.count("red") == 0
          return "CUT THE LAST WIRE"
        else
          return "CUT THE FOURTH WIRE"
        end
      else
        return solve_wires(configuration, bomb)
      end
    end
  end
end