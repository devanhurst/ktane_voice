require 'pry'
module Passwords
  @passwords = ['about', 'after', 'again', 'below', 'could',
                'every', 'first', 'found', 'great', 'house',
                'large', 'learn', 'never', 'other', 'place',
                'plant', 'point', 'right', 'small', 'sound',
                'spell', 'still', 'study', 'their', 'there',
                'these', 'thing', 'think', 'three', 'water',
                'where', 'which', 'world', 'would', 'write']

  def solve(column, input, bomb)
    bomb.password_columns[column] = input.uniq # password_column_x is overwritten with the new letters
    Speech.new(bomb.password_columns[column].join(' ')).speak
    possibilities = Array.new(@passwords)
    bomb.password_columns.each do |column, letters|
      if bomb.password_columns[column] != []
        possibilities.each do |password|
          if letters.include?(password[column-1]) == false
            possibilities[possibilities.index(password)] = 0
          end
        end
      end
      possibilities.delete(0)
    end
    if possibilities.count == 1
      return "The password is #{possibilities.first}."
    else
      return prompt_user(bomb)
    end
  end

  def prompt_user(bomb)
    return solve(prompt_column, prompt_input, bomb)
  end

  def prompt_input
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/passwords.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |letters|
      return parse_nato(letters.split(' '))
    end
  end

  def prompt_column
    Speech.new("Column?").speak
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/passwordscolumn.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |column|
      case column
      when 'one'
        Speech.new('1').speak
        return 1
      when 'two'
        Speech.new('2').speak
        return 2
      when 'three'
        Speech.new('3').speak
        return 3
      when 'four'
        Speech.new('4').speak
        return 4
      when 'five'
        Speech.new('5').speak
        return 5
      end
    end
  end

  def parse_nato(word_array)
    word_array.delete('next')
    word_array.delete('done')
    word_array.each_with_index do |word, index|
      word_array[index] = word[0]
    end
    return word_array
  end
end