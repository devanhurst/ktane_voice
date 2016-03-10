module Knobs
  def solve_knobs(configuration)
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |directions|
      case directions
      when 'down down both down up both', 'up down both none both down'
        return "UP"
      when 'down both both down none both', 'up down up none up down'
        return "DOWN"
      when 'down none none down both down', 'none none none down both none'
        return "LEFT"
      when 'both down both up both up', 'both down both up down none'
        return "RIGHT"
      end
    end
  end
end