require 'pocketsphinx-ruby'
require 'pry'
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

@bomb = Bomb.new

Speech.new("Ready.").speak

def select_module
  configuration = Pocketsphinx::Configuration::Grammar.new('grammars/module.gram')
  recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
  recognizer.recognize do |speech|
    puts speech
    case speech
    when "bomb check"
      Speech.new("Go!").speak
      Speech.new(Check.check_all(Pocketsphinx::Configuration::Grammar.new('grammars/check.gram'), @bomb)).speak
      return select_module
    when "defuse wires"
      Speech.new(Wires.solve_wires(Pocketsphinx::Configuration::Grammar.new('grammars/wires.gram'), @bomb)).speak
      return select_module
     when "defuse button"
      Speech.new(Button.solve_button(Pocketsphinx::Configuration::Grammar.new('grammars/button.gram'), @bomb)).speak
      return select_module
    when "defuse keypads"
      Speech.new(Keypads.sanitize_input(Pocketsphinx::Configuration::Grammar.new('grammars/keypads.gram'))).speak
      return select_module
    when "defuse memory"
      Speech.new(Memory.solve_memory(Pocketsphinx::Configuration::Grammar.new('grammars/memory.gram'), @bomb)).speak
      return select_module
    when "defuse sequence"
      Speech.new(WireSequences.solve_wire_sequences(Pocketsphinx::Configuration::Grammar.new('grammars/wiresequences.gram'), @bomb)).speak
      return select_module
    when "reset wire sequences"
      Speech.new(WireSequences.reset_wire_sequences(@bomb)).speak
      return select_module
    when "defuse words"
      Speech.new(Words.solve_1(Pocketsphinx::Configuration::Grammar.new('grammars/words1.gram'))).speak
      return select_module
    when "defuse complicated"
      Speech.new(ComplicatedWires.solve_complicated(Pocketsphinx::Configuration::Grammar.new('grammars/complicatedwires.gram'), @bomb)).speak
      return select_module
    when "defuse morse code"
      Speech.new(MorseCode.prompt_morse_code).speak
      return select_module
    when "defuse maze"
      Mazes.prompt_mazes
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