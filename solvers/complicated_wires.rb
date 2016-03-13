module ComplicatedWires
  def cut?(combination, bomb)
    10.times { puts combination }
    case combination
    when 'nothing', 'star', 'red star'
      return true
    when 'light', 'blue star', 'blue light red star'
      return false
    when 'red', 'blue', 'blue red', 'blue light red'
      if bomb.final_digit_odd == nil
        bomb.spontaneous_final_digit_check
      end
      !bomb.final_digit_odd ? (return true) : (return false)
    when 'light star', 'light red', 'light red star'
      if bomb.battery_count == nil
        bomb.spontaneous_batteries_check
      end
      bomb.battery_count >= 2 ? (return true) : (return false)
    when 'blue red star', 'blue light', 'blue light star'
      if bomb.parallel_port == nil
        bomb.spontaneous_parallel_port_check
      end
      bomb.parallel_port ? (return true) : (return false)
    end
  end

  def solve_complicated(configuration, bomb)
    solution = ""
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |wires|
      wires = wires.split(' ')
      wires.delete('done')
      wires = wires.join(' ').split("next")
      wires.each do |combination|
        combination.strip!
        cut?(combination.split(' ').uniq.sort.join(' '), bomb) ? (solution += "YES...") : (solution += "NO...")
      end
      return solution
    end
  end
end