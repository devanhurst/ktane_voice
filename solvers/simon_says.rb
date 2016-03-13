module Simon
  def solve_simon(configuration, bomb)
    if bomb.vowel == nil
      bomb.spontaneous_vowel_check
    end
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |colors|
      sequence = colors.split(' ')
      sequence.delete('done')
      solution = determine_current_solution(bomb)
      spoken_answer = ""
      sequence.each do |color|
        spoken_answer += "#{solution[color]} "
      end
      return spoken_answer
    end
  end

  def determine_current_solution(bomb)
    if bomb.vowel == true
      case bomb.strikes
      when 0
        return {'red' => 'blue', 'blue' => 'red', 'green' => 'yellow', 'yellow' => 'green'}
      when 1
        return {'red' => 'yellow', 'blue' => 'green', 'green' => 'blue', 'yellow' => 'red'}
      when 2
        return {'red' => 'green', 'blue' => 'red', 'green' => 'yellow', 'yellow' => 'blue'}
      end
    elsif bomb.vowel == false
      case bomb.strikes
      when 0
        return {'red' => 'blue', 'blue' => 'yellow', 'green' => 'green', 'yellow' => 'red'}
      when 1
        return {'red' => 'red', 'blue' => 'blue', 'green' => 'yellow', 'yellow' => 'green'}
      when 2
        return {'red' => 'yellow', 'blue' => 'green', 'green' => 'blue', 'yellow' => 'red'}
      end
    end
  end
end