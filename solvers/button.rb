module Button
  def solve_button(configuration, bomb)
    recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
    recognizer.recognize do |speech|
      colour = speech.split(' ')[0]
      word = speech.split(' ')[1]

      if word == "abort" && colour == "blue"
        return hold_button
      end

      if word == "detonate" && bomb.battery_count == nil
        bomb.spontaneous_batteries_check
      end
      if word == "detonate" && bomb.battery_count > 1
        return press_button
      end        
      
      if colour == "white" && bomb.indicator_car == nil
        bomb.spontaneous_indicator_car_check
      end
      if colour == "white" && bomb.indicator_car == true
        return hold_button
      end
      
      if bomb.indicator_frk == nil
        bomb.spontaneous_indicator_frk_check
      end
      if bomb.battery_count == nil
        bomb.spontaneous_batteries_check
      end            
      if bomb.indicator_frk == true && bomb.battery_count > 2
        return press_button
      end
      
      if colour == "yellow"
        return hold_button
      end

      if word == "hold" && colour == "red"
        return press_button
      end
      
      return hold_button
      
    end
  end

  def press_button
    return "PRESS THE BUTTON"
  end

  def hold_button
    Speech.new("HOLD THE BUTTON. STRIPE COLOUR?").speak
    stripe_color = Pocketsphinx::Configuration::Grammar.new('./grammars/buttonstripe.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(stripe_color).recognize do |speech|
      case speech
      when "blue"
        return "TIMER... FOUR"
      when "yellow"
        return "TIMER... FIVE"
      else
        return "TIMER... ONE"
      end
    end
  end
end