module Button
  def solve_button(configuration, bomb)
    Speech.new("button go").speak
    recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
    recognizer.recognize do |speech|
      colour = speech.split(' ')[0]
      word = speech.split(' ')[1]

      if word == "abort" && colour == "blue"
        return hold_button
      elsif word == "detonate" && bomb.battery_count > 1
        return press_button        
      elsif colour == "white" && bomb.indicator_car == true
        return hold_button
      elsif bomb.indicator_frk == true && bomb.battery_count > 2
        return press_button
      elsif colour == "yellow"
        return hold_button
      elsif word == "hold" && colour == "red"
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
    Speech.new("HOLD THE BUTTON. WHAT IS THE STRIPE COLOUR?").speak
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