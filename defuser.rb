require 'pocketsphinx-ruby'

require "espeak"
include ESpeak

require "require_all"
require_relative "bomb"
require_rel "solvers"

include Check
include Wires
include Button

@bomb = Bomb.new

Speech.new("Ready to defuse.").speak

def select_module
  configuration = Pocketsphinx::Configuration::Grammar.new('grammars/module.gram')
  recognizer = Pocketsphinx::LiveSpeechRecognizer.new(configuration)
  recognizer.recognize do |speech|
    puts speech
    case speech
    when "bomb check"
      Speech.new(Check.check_all(Pocketsphinx::Configuration::Grammar.new('grammars/check.gram'), @bomb)).speak
      return select_module
    when "wires"
      Speech.new(Wires.solve(Pocketsphinx::Configuration::Grammar.new('grammars/wires.gram'), @bomb)).speak
      return select_module
     when "button"
      Speech.new(Button.solve(Pocketsphinx::Configuration::Grammar.new('grammars/button.gram'), @bomb)).speak
      return select_module
    end
  end
end

select_module