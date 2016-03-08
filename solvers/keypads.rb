require 'pry'
module Keypads
  @choices = ['letter q', 'letter a', 'lambda', 'lightning', 'alien', 'letter h', 'backwards c', 'letter e',
            'curly', 'white star', 'question mark', 'copyright', 'butt', 'letter i', 'letter r',
            'six', 'paragraph', 'letter p', 'smiley', 'trident', 'letter c', 'black star', 'snake',
            'hash', 'a e', 'letter n', 'omega']

  @solutions = [['letter q','letter a','lambda','lightning','alien','letter h','backwards c'],
                ['letter e','letter q','backwards c','curly','white star','letter h','question mark'],
                ['copyright','butt','curly','letter i','letter r','lambda','white star'],
                ['six','paragraph','letter p','alien','letter i','question','smiley'],
                ['trident','smiley','letter p','letter c','paragraph','snake','black star'],
                ['six','letter e','hash','a e','trident','letter n','omega']]
  @possible_answer = []
  @final_answer = []
  @count = 0

  def sanitize_input(configuration)
    recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
    recognizer.recognize do |symbols|
      puts symbols
      symbols = symbols.split(' ')
      symbols.delete('um')
      symbols = symbols.join(' ').split('key')
      symbols.delete("")
      symbols.each do |symbol|
        symbol.strip!
      end
      return solve_keypads(symbols)
    end
  end

  def solve_keypads(symbols, count=0)
    binding.pry
    if count == 6
      Speech.new("Please try again.")
      return sanitize_input(Pocketsphinx::Configuration::Grammar.new('./grammars/keypads.gram'))
    end
    symbols.each do |symbol|
      if @solutions[count].include?(symbol)
        @possible_answer.push(symbol)
      end
    end
    if @possible_answer.count == 4
      @solutions[count].each do |solution_item|
        if symbols.include?(solution_item)
          @final_answer.push(solution_item)
        end
      end
      return @final_answer.join('... ')
    else
        @possible_answer = []
        solve_keypads(symbols, count + 1)
    end
  end
end