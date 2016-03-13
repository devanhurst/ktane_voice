class Bomb

  attr_accessor :vowel
  attr_accessor :final_digit_odd
  attr_accessor :battery_count
  attr_accessor :indicator_car
  attr_accessor :indicator_frk
  attr_accessor :parallel_port
  attr_accessor :strikes
  attr_accessor :memory_round
  attr_accessor :memory_positions
  attr_accessor :memory_labels
  attr_accessor :wire_sequences_red_count
  attr_accessor :wire_sequences_blue_count
  attr_accessor :wire_sequences_black_count
  attr_accessor :wire_sequences_moves
  attr_accessor :password_columns
  attr_accessor :morse_characters

  def initialize
    @vowel = nil
    @final_digit_odd = nil
    @battery_count = nil
    @indicator_car = nil
    @indicator_frk = nil
    @parallel_port = nil
    @strikes = 0
    @memory_round = 1
    @memory_positions = {}
    @memory_labels = {}
    @wire_sequences_black_count = 0
    @wire_sequences_blue_count = 0
    @wire_sequences_red_count = 0
    @wire_sequences_moves = []
    @password_columns = { 1=>[], 2=>[], 3=>[], 4=>[], 5=>[] }
    @morse_characters = []
  end

  def spontaneous_vowel_check
    Speech.new("Is there a vowel?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/binarycheck.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      if response == 'yes'
        Speech.new("Vowel").speak
        @vowel = true
      elsif response == 'no'
        Speech.new("No vowel.").speak
        @vowel = false
      end
      return
    end
  end

  def spontaneous_final_digit_check
    Speech.new("What is the final digit?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/numbercheck.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      case response
      when 'one', 'three', 'five', 'nine'
        Speech.new("Odd").speak
        @final_digit_odd = true
      else
        Speech.new("Even").speak
        @final_digit_odd = false
      end
      return
    end
  end

  def spontaneous_batteries_check
    Speech.new("How many batteries?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/numbercheck.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      case response
      when 'zero'
        @battery_count = 0
      when 'one'
        @battery_count = 1
      when 'two'
        @battery_count = 2
      when 'three'
        @battery_count = 3
      when 'four'
        @battery_count = 4
      when 'five', 'six', 'seven', 'eight', 'nine'
        @battery_count = 5
      end
      Speech.new(response).speak
      return
    end
  end

  def spontaneous_indicator_car_check
    Speech.new("Is there a lit car indicator?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/binarycheck.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      if response == 'yes'
        Speech.new('car').speak
        @indicator_car = true
      elsif response == 'no'
        Speech.new('no car').speak
        @indicator_car = false
      end
      return
    end
  end

  def spontaneous_indicator_frk_check
    Speech.new("Is there a lit freak indicator?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/binarycheck.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      if response == 'yes'
        Speech.new('freak').speak
        @indicator_frk = true
      elsif response == 'no'
        Speech.new('no freak').speak
        @indicator_frk = false
      end
      return
    end
  end

  def spontaneous_parallel_port_check
    Speech.new("Is there a parallel port?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/binarycheck.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |response|
      if response == 'yes'
        Speech.new('parallel port').speak
        @parallel_port = true
      elsif response == 'no'
        Speech.new('no parallel port').speak
        @parallel_port = false
      end
      return
    end
  end
end
