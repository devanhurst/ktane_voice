module Memory
  def solve_memory(configuration, bomb)
    Speech.new("Round #{bomb.memory_round}... go").speak
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      response = response.split(' ')
      response.delete('sequence')
      response.each_with_index do |digit, index|
        case digit
        when 'one'
          response[index] = 1
        when 'two'
          response[index] = 2
        when 'three'
          response[index] = 3
        when 'four'
          response[index] = 4
        end
      end
      display_digit = response[0]
      case bomb.memory_round
      when 1
        case display_digit
        when 1
          position = 2
          label = response[position]
        when 2
          position = 2
          label = response[position]
        when 3
          position = 3
          label = response[position]
        when 4
          position = 4
          label = response[position]
        end
      when 2
        case display_digit
        when 1
          label = 4
          position = response.index(4)
        when 2
          position = bomb.memory_positions[1]
          label = response[position]
        when 3
          position = 1
          label = response[position]
        when 4
          position = bomb.memory_positions[1]
          label = response[position]
        end
      when 3
        case display_digit
        when 1
          label = bomb.memory_labels[2]
          position = response[label]
        when 2
          label = bomb.memory_labels[1]
          position = response[label]
        when 3
          position = 3
          label = response[position]
        when 4
          label = 4
          position = response.index(4)
        end
      when 4
        case display_digit
        when 1
          position = bomb.memory_positions[1]
          label = response[position]
        when 2
          position = 1
          label = response[position]
        when 3
          position = bomb.memory_positions[2]
          label = response[position]
        when 4
          position = bomb.memory_positions[2]
          label = response[position]
        end
      when 5
        case display_digit
        when 1
          label = bomb.memory_labels[1]
        when 2
          label = bomb.memory_labels[2]
        when 3
          label = bomb.memory_labels[4]
        when 4
          label = bomb.memory_labels[3]
        end  
      end
      bomb.memory_labels[bomb.memory_round] = label
      bomb.memory_positions[bomb.memory_round] = position
      bomb.memory_round += 1
      return "Press... #{label}"
    end
  end
end