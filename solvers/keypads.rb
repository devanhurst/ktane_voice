module Keypads
  @choices = ['q', 'a', 'lambda', 'lightning', 'alien', 'h', 'backwards c', 'e',
            'curly', 'whitestar', 'question', 'copyright', 'butt', 'i', 'r',
            '6', 'paragraph', 'p', 'smiley', 'trident', 'c', 'blackstar', 'snake',
            'hash', 'ae', 'n', 'omega']

  @solutions = [['q','a','lambda','lightning','alien','h','backwards c'],
                ['e','q','backwards c','curly','whitestar','h','question'],
                ['copyright','butt','curly','i','r','lambda','whitestar'],
                ['6','paragraph','p','alien','i','question','smiley'],
                ['trident','smiley','p','c','paragraph','snake','blackstar'],
                ['6','e','hash','ae','trident','n','omega']]
  @final_answer = []

  def solve(configuration)
    system "clear" or system "cls"
    if count > 5
      puts "INVALID SYMBOL SET. TRY AGAIN"
      sleep(1)
      prompt_user
    else
      symbols.each do |symbol|
        if @solutions[count].include?(symbol)
          @final_answer.push(symbol)
        end
      end
      if @final_answer.count == 4
        @solutions[count].each do |solution_item|
          if symbols.include?(solution_item)
            puts solution_item.upcase
          end
        end
        @bomb.back_to_menu
      else
        @final_answer = []
        solve(symbols, count + 1)
      end
    end
  end
end