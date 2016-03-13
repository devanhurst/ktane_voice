module MorseCode
  @solutions = {"shell" => "3.505", "halls" => "3.515", "slick" => "3.522",
                "trick" => "3.532", "boxes" => "3.535", "leaks" => "3.542",
                "strobe" => "3.545", "bistro" => "3.552", "flick" => "3.555",
                "bombs" => "3.565", "break" => "3.572", "brick" => "3.575",
                "steak" => "3.582", "sting" => "3.592", "vector" => "3.595",
                "beats" => "3.600"}

  def solve_morse_code(bomb)
    possible_answers = []
    @solutions.each do |solution|
      bomb.morse_characters.each do |character|
        if solution[0].include?(character) == false
          possible_answers.delete(solution[1])
          break
        end
        possible_answers.push(solution[1])
      end
    end
    if possible_answers.uniq.count == 1
      bomb.morse_characters = []
      return "ANSWER... #{possible_answers.first}"
    else
      return prompt_morse_code(bomb)
    end
  end

  def prompt_morse_code(bomb)
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/morsecode.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |morse|
      if morse == "escape morse code"
        return "Escaped."
      else
        morse = morse.split(' ')
        morse.delete('next')
        morse.delete('morse')
        letter = parse_morse_code(morse)
        Speech.new(letter).speak
        bomb.morse_characters.push(letter)
        return solve_morse_code(bomb)
      end
    end
  end

  def parse_morse_code(dot_dash_array)
    dot_dash_array.each_with_index do |word, index|
      case word
      when "dot"
        dot_dash_array[index] = "."
      when "dash"
        dot_dash_array[index] = "-"
      end
    end
  
    case dot_dash_array.join('')
    when '.-'
      return 'a'
    when '-...'
      return 'b'
    when '-.-.'
      return 'c'
    when '-..'
      return 'd'
    when '.'
      return 'e'
    when '..-.'
      return 'f'
    when '--.'
      return 'g'
    when '....'
      return 'h'
    when '..'
      return 'i'
    when '.---'
      return 'j'
    when '-.-'
      return 'k'
    when '.-..'
      return 'l'
    when '--'
      return 'm'
    when '-.'
      return 'n'
    when '---'
      return 'o'
    when '.--.'
      return 'p'
    when '--.-'
      return 'q'
    when '.-.'
      return 'r'
    when '...'
      return 's'
    when '-'
      return 't'
    when '..-'
      return 'u'
    when '...-'
      return 'v'
    when '.--'
      return 'w'
    when '-..-'
      return 'x'
    when '-.--'
      return 'y'
    when '--..'
      return 'z'
    else
      return ''
      Speech.new("Invalid.").speak
    end
  end
end