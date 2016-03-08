module Button
  def solve_button(configuration, bomb)
    recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
    recognizer.recognize do |speech|
      colour = speech[0]
      word = speech[1]
      if word == "abort" && colour == "blue"
        return hold_button
      end

      if word == "detonate"
        bomb.batteries_check
        if bomb.battery_count > 1
          return press_button
        end
      end

      if colour == "white"
        bomb.indicator_car_check
        if bomb.indicator_car == true
          return hold_button
        end
      end

      if bomb.indicator_frk == nil && bomb.batteries_check == nil
        bomb.batteries_check
        bomb.indicator_frk_check
        if bomb.indicator_frk == true && bomb.battery_count > 2
          return press_button
        end
      elsif bomb.indicator_frk == true && bomb.batteries_check == nil
        bomb.batteries_check
        if bomb.battery_count > 2
          return press_button
        end
      elsif bomb.indicator_frk == nil && bomb.battery_count > 2
        bomb.indicator_frk_check
        if bomb.indicator_frk == true
          return press_button
        end
      elsif bomb.indicator_frk == true && bomb.battery_count > 2
        return press_button
      end

      if colour == "yellow"
        return hold_button
      end

      if word == "hold" && colour == "red"
        return press_button
      else
        return hold_button
      end
    end
  end

  def press_button
    return "PRESS THE BUTTON"
  end

  def hold_button
    Speech.new("HOLD THE BUTTON. WHAT IS THE STRIKE COLOUR?").speak
    stripe_color = Pocketsphinx::Configuration::Grammar.new('./grammars/buttonstripe.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(stripe_color).recognize do |speech|
      case speech
      when "blue"
        return "PRESS TIMER... FOUR"
      when "yellow"
        return "PRESS TIMER... FIVE"
      else
        return "PRESS TIMER... ONE"
      end
    end
  end
end