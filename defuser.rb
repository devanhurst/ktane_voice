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
    when "defuse wires"
      Speech.new(Wires.solve_wires(Pocketsphinx::Configuration::Grammar.new('grammars/wires.gram'), @bomb)).speak
      return select_module
     when "defuse button"
      Speech.new(Button.solve_button(Pocketsphinx::Configuration::Grammar.new('grammars/button.gram'), @bomb)).speak
      return select_module
    when "defuse keypads"
      Speech.new(Keypads.sanitize_input(Pocketsphinx::Configuration::Grammar.new('grammars/keypads.gram'))).speak 
      return select_module
    when "we're finished"
      Speech.new("It was my pleasure.").speak
      return
    end
  end
end

select_module