require 'pocketsphinx-ruby'
require 'pry'
require 'ordinator'
require "espeak"
include ESpeak

require "require_all"
require_relative "bomb"
require_rel "solvers"

include Check
include Wires
include Button
include Keypads
include Memory
include WireSequences
include Words
include ComplicatedWires
include MorseCode
include Mazes
include Passwords
include Simon
include Knobs

@bomb = Bomb.new

Speech.new("Ready.").speak

def select_module
  configuration = Pocketsphinx::Configuration::Grammar.new('grammars/module.gram')
  recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
  recognizer.recognize do |speech|
    case speech
    when "bomb check"
      Speech.new("Check").speak
      Speech.new(Check.check_all(Pocketsphinx::Configuration::Grammar.new('grammars/check.gram'), @bomb)).speak
      return select_module
    when "defuse wires"
      Speech.new("Wires").speak
      Speech.new(Wires.solve_wires(Pocketsphinx::Configuration::Grammar.new('grammars/wires.gram'), @bomb)).speak
      return select_module
     when "defuse button"
      Speech.new("Button").speak
      Speech.new(Button.solve_button(Pocketsphinx::Configuration::Grammar.new('grammars/button.gram'), @bomb)).speak
      return select_module
    when "defuse keypads"
      Speech.new("Keypads").speak
      Speech.new(Keypads.sanitize_input(Pocketsphinx::Configuration::Grammar.new('grammars/keypads.gram'))).speak
      return select_module
    when "defuse memory"
      Speech.new("Round #{@bomb.memory_round}").speak
      Speech.new(Memory.solve_memory(Pocketsphinx::Configuration::Grammar.new('grammars/memory.gram'), @bomb)).speak
      return select_module
    when "defuse sequence"
      Speech.new("Sequence").speak
      Speech.new(WireSequences.solve_wire_sequences(Pocketsphinx::Configuration::Grammar.new('grammars/wiresequences.gram'), @bomb)).speak
      return select_module
    when "defuse words"
      Speech.new(Words.solve_1(Pocketsphinx::Configuration::Grammar.new('grammars/words1.gram'))).speak
      return select_module
    when "defuse complicated"
      Speech.new("Complicated").speak
      Speech.new(ComplicatedWires.solve_complicated(Pocketsphinx::Configuration::Grammar.new('grammars/complicatedwires.gram'), @bomb)).speak
      return select_module
    when "defuse morse code"
      Speech.new("letter.").speak
      Speech.new(MorseCode.prompt_morse_code(@bomb)).speak
      return select_module
    when "defuse maze"
      Mazes.prompt_mazes
      return select_module
    when "defuse password"
      Speech.new(Passwords.prompt_user(@bomb)).speak
      return select_module
    when "defuse simon"
      Speech.new("Simon").speak
      Speech.new(Simon.solve_simon(Pocketsphinx::Configuration::Grammar.new('grammars/simonsays.gram'), @bomb)).speak
      return select_module
    when "defuse knobs"
      Speech.new("Knob").speak
      Speech.new(Knobs.solve_knobs(Pocketsphinx::Configuration::Grammar.new('grammars/knobs.gram'))).speak
      return select_module

    when "reset wire sequences"
      @bomb.wire_sequences_red_count = 0
      @bomb.wire_sequences_blue_count = 0
      @bomb.wire_sequences_black_count = 0
      Speech.new("Wire sequences reset.").speak
      return select_module
    when "reset password"
      @bomb.password_columns = { 1=>[], 2=>[], 3=>[], 4=>[], 5=>[] }
      Speech.new("Passwords reset.").speak
      return select_module
    when "reset memory"
      @bomb.memory_round = 1
      @bomb.memory_positions = {}
      @bomb.memory_labels = {}
      Speech.new("Memory reset.").speak
      return select_module
    when "reset morse code"
      @bomb.morse_characters = []
      Speech.new("Morse reset.")
      return select_module

    when "add a strike"
      @bomb.strikes += 1
      Speech.new("#{Ordinator.convert(@bomb.strikes)} strike").speak
      return select_module

    when "the bomb is defused", "we did it"
      Speech.new(["It was my pleasure.", "I'm proud of us.", "We did it!"].sample).speak
      return select_module
    when "the bomb detonated", "the bomb blew up"
      Speech.new(["It was all my fault.", "It's not my fault.", "I hope you're proud of yourself."].sample).speak
      return select_module
    end
  end
end

select_module