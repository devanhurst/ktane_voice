module WireSequences
  @red_sequence = [ ['charlie'], ['bravo'], ['alpha'], ['alpha', 'charlie'], ['bravo'], ['alpha', 'charlie'], ['alpha', 'bravo', 'charlie'], ['alpha', 'bravo'], ['bravo']]
  @blue_sequence = [['bravo'], ['alpha', 'charlie'], ['bravo'], ['alpha'], ['bravo'], ['bravo', 'charlie'], ['charlie'], ['alpha', 'charlie'], ['alpha']]
  @black_sequence = [['alpha', 'bravo', 'charlie'], ['alpha', 'charlie'], ['bravo'], ['alpha', 'charlie'], ['bravo'], ['bravo', 'charlie'], ['alpha', 'bravo'], ['charlie'], ['charlie']]

  def solve_wire_sequences(configuration, bomb)
    spoken_response = ""
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |input|
      puts input
      input.delete('done')
      input.split("next").each do |pair|
        pair.strip!
        pair = pair.split(" ")
        case pair[0]
        when 'red'
          if @red_sequence[bomb.wire_sequences_red_count].include?(pair[1])
            spoken_response += "YES... "
          else
            spoken_response += "NO... "
          end 
          bomb.wire_sequences_red_count += 1
        when 'blue'
          if @blue_sequence[bomb.wire_sequences_blue_count].include?(pair[1])
            spoken_response +=  'YES... '
          else
            spoken_response +=  "NO... "
          end
          bomb.wire_sequences_blue_count += 1
        when 'black'
          if @black_sequence[bomb.wire_sequences_black_count].include?(pair[1])
            spoken_response += 'YES... '
          else
            spoken_response += "NO... "
          end
          bomb.wire_sequences_black_count += 1
        end
      end
      if bomb.wire_sequences_black_count + bomb.wire_sequences_red_count + bomb.wire_sequences_blue_count == 9
        bomb.wire_sequences_blue_count = 0
        bomb.wire_sequences_black_count = 0
        bomb.wire_sequences_red_count = 0
      end
      return spoken_response
    end
  end

  def reset_wire_sequences(bomb)
    bomb.wire_sequences_red_count = 0
    bomb.wire_sequences_black_count = 0
    bomb.wire_sequences_blue_count = 0
    return "Sequence reset"
  end
end