module Words
  def solve_1(configuration)
    Speech.new("word").speak
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |word|
      word = word.split("the word is ").last
      top_left_words = ['you are letters']
      top_right_words = ['first', 'okay', 'c letter']
      middle_left_words = ['yes', 'nothing', 'l e d', 'they are words']
      middle_right_words = ['blank', 'read a book', 'red color', 'you word', 'your possessive', "you're contraction", 'their possessive']
      bottom_left_words = ['empty', 'reed instrument', 'leeds england', "they're contraction"]
      bottom_right_words = ['display', 'says', 'no', 'lead guitar', 'hold on', 'you are words', 'there location', 'see a movie', 'c word']

      if top_left_words.include?(word)
        Speech.new("top left").speak
        return solve_2
      elsif top_right_words.include?(word)
        Speech.new("top right").speak
        return solve_2
      elsif middle_left_words.include?(word)
        Speech.new("middle left").speak
        return solve_2
      elsif middle_right_words.include?(word)
        Speech.new("middle right").speak
        return solve_2
      elsif bottom_left_words.include?(word)
        Speech.new("bottom left").speak
        return solve_2
      elsif bottom_right_words.include?(word)
        Speech.new("bottom right").speak
        return solve_2
      end
    end
  end

  def solve_2
    solutions = {
      "ready" => ["yes", "okay", "what", "middle", "left", "press", "right", "blank", "ready"],
      "first" => ["left", "okay", "yes", "middle", "no", "right", "nothing", "uhhh", "wait", "ready", "blank", "what", "press", "first"],
      "no" => ["blank", "uhhh", "wait", "first", "what", "ready", "right", "yes", "nothing", "left", "press", "okay", "no"],
      "blank" => ["wait", "right", "okay", "middle", "blank"],
      "nothing" => ["uhhh", "right", "okay", "middle", "yes", "blank", "no", "press", "left", "what", "wait", "first", "nothing"],
      "yes" => ["okay", "right", "uhhh", "middle", "first", "what", "press", "ready", "nothing", "yes"],
      "what statement" => ["uhhh", "what"],
      "u h h h" => ["ready", "nothing", "left", "what", "okay", "yes", "right", "no", "press", "blank", "uhhh"],
      "left" => ["right", "left"],
      "right" => ["yes", "nothing", "ready", "press", "no", "wait", "what", "right"],
      "middle" => ["blank", "ready", "okay", "what", "nothing", "press", "no", "wait", "left", "middle"],
      "okay" => ["middle", "no", "first", "yes", "uhhh", "nothing", "wait", "okay"],
      "wait" => ["uhhh", "no", "blank", "okay", "yes", "left", "first", "press", "what", "wait"],
      "press" => ["right", "middle", "yes", "ready", "press"],
      "you word" => ["sure", "you are words", "your possessive", "you're contraction", "next", "uh huh", "u r letters", "hold", "what question", "you word"],
      "you are words" => ["your possessive", "next", "like", "uh huh", "what question", "done", "staccato", "hold", "you word", "u letter", "you're contraction", "sure", "u r letters", "you are words"],
      "your possessive" => ["staccato", "you are words", "uh huh", "your possessive"],
      "you're contraction" => ["you word", "you're contraction"],
      "u r letters" => ["done", "u letter", "u r letters"],
      "u letter" => ["uh huh", "sure", "next", "what question", "you're contraction", "u r letters", "staccato", "done", "u letter"],
      "uh huh" => ["uh huh"],
      "staccato" => ["u r letters", "u letter", "you are words", "you word", "done", "hold", "staccato"],
      "what question" => ["you word", "hold", "you're contraction", "your possessive", "u letter", "done", "staccato", "like", "you are words", "uh huh", "u r letters", "next", "what question"],
      "done" => ["sure", "uh huh", "next", "what question", "your possessive", "u r letters", "you're contraction", "hold", "like", "you word", "u letter", "you are words", "staccato", "done"],
      "next" => ["what question", "uh huh", "staccato", "your possessive", "hold", "sure", "next"],
      "hold" => ["you are words", "u letter", "done", "staccato", "you word", "u r letters", "sure", "what question", "you're contraction", "next", "hold"],
      "sure" => ["you are words", "done", "like", "you're contraction", "you word", "hold", "uh huh", "u r letters", "sure"],
      "like" => ["you're contraction", "next", "u letter", "u r letters", "hold", "staccato", "what question", "uh huh", "you word", "like"]
    }
    Pocketsphinx::LiveSpeechRecognizer.new(Pocketsphinx::Configuration::Grammar.new('grammars/words2.gram')).recognize do |word|
      word = word.split("the word is ").last
      return solutions[word].join('... ')
    end
  end

end