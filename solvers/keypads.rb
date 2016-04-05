require 'pry'
module Keypads
  @choices = ['balloon', 'pyramid', 'lambda', 'lightning', 'spaceship', 'letter h', 'backward c', 'letter e',
            'curly fry', 'white star', 'question mark', 'copyright', 'butt', 'inkblot', 'half r',
            'six', 'paragraph', 'upside down p', 'smiley face', 'trident', 'c square', 'black star', 'snake',
            'hash', 'a e together', 'letter n', 'omega']

  @solutions = [['balloon','pyramid','lambda','lightning','spaceship','letter h','backward c'],
                ['letter e','balloon','backward c','curly fry','white star','letter h','question mark'],
                ['copyright','butt','curly fry','inkblot','half r','lambda','white star'],
                ['six','paragraph','upside down p','spaceship','inkblot','question mark','smiley face'],
                ['trident','smiley face','upside down p','c square','paragraph','snake','black star'],
                ['six','letter e','hash','a e together','trident','letter n','omega']]
  @possible_answer = []
  @final_answer = []
  @count = 0

  def sanitize_input(configuration)
    @possible_answer = []
    @final_answer = []
    @count = 0
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