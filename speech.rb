require 'pocketsphinx-ruby'

Pocketsphinx::LiveSpeechRecognizer.new.recognize do |speech|
  puts speech
end