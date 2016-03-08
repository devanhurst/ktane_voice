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
    when "the bomb is defused", "we made it"
      Speech.new(["It was my pleasure.", "I'm proud of us.", "We did it!", "Thank fuck for that."].sample).speak
      return
    when "the bomb detonated", "the bomb blew up"
      Speech.new(["It was all my fault.", "It's not my fault.", "I hope you're proud of yourself.", "You shit dick."].sample).speak
      return
    end
  end
end

select_module