module Mazes
  @maze_1 = [['*',' ','*',' ','*','X','*',' ','*',' ','*'],
             [' ','X','X','X',' ','X',' ','X','X','X','X'],
             ['#','X','*',' ','*','X','*',' ','*',' ','*'],
             [' ','X',' ','X','X','X','X','X','X','X',' '],
             ['*','X','*',' ','*','X','*',' ','*',' ','#'],
             [' ','X','X','X',' ','X',' ','X','X','X',' '],
             ['*','X','*',' ','*',' ','*','X','*',' ','*'],
             [' ','X','X','X','X','X','X','X','X','X',' '],
             ['*',' ','*',' ','*','X','*',' ','*','X','*'],
             [' ','X','X','X',' ','X',' ','X','X','X',' '],
             ['*',' ','*','X','*',' ','*','X','*',' ','*']]

  @maze_2 = [['*',' ','*',' ','*','X','*',' ','*',' ','*'],
             ['X','X',' ','X','X','X',' ','X',' ','X','X'],
             ['*',' ','*','X','*',' ','*','X','#',' ','*'],
             [' ','X','X','X',' ','X','X','X','X','X',' '],
             ['*','X','*',' ','*','X','*',' ','*',' ','*'],
             [' ','X',' ','X','X','X',' ','X','X','X',' '],
             ['*',' ','#','X','*',' ','*','X','*','X','*'],
             [' ','X','X','X',' ','X','X','X',' ','X',' '],
             ['*','X','*','X','*','X','*',' ','*','X','*'],
             [' ','X',' ','X',' ','X',' ','X','X','X',' '],
             ['*','X','*',' ','*','X','*',' ','*',' ','*']]

  @maze_3 = [['*',' ','*',' ','*','X','*','X','*',' ','*'],
             [' ','X','X','X',' ','X',' ','X',' ','X',' '],
             ['*','X','*','X','*','X','*',' ','*','X','*'],
             ['X','X',' ','X',' ','X','X','X','X','X',' '],
             ['*',' ','*','X','*','X','*',' ','*','X','*'],
             [' ','X',' ','X',' ','X',' ','X',' ','X',' '],
             ['*','X','*','X','*','X','#','X','*','X','#'],
             [' ','X',' ','X',' ','X',' ','X',' ','X',' '],
             ['*','X','*',' ','*','X','*','X','*','X','*'],
             [' ','X','X','X','X','X',' ','X',' ','X',' '],
             ['*',' ','*',' ','*',' ','*','X','*',' ','*']]

  @maze_4 = [['#',' ','*','X','*',' ','*',' ','*',' ','*'],
             [' ','X',' ','X','X','X','X','X','X','X',' '],
             ['*','X','*','X','*',' ','*',' ','*',' ','*'],
             [' ','X',' ','X',' ','X','X','X','X','X',' '],
             ['*','X','*',' ','*','X','*',' ','*','X','*'],
             [' ','X','X','X','X','X',' ','X','X','X',' '],
             ['#','X','*',' ','*',' ','*',' ','*',' ','*'],
             [' ','X','X','X','X','X','X','X','X','X',' '],
             ['*',' ','*',' ','*',' ','*',' ','*','X','*'],
             [' ','X','X','X','X','X','X','X',' ','X',' '],
             ['*',' ','*',' ','*','X','*',' ','*','X','*']]

  @maze_5 = [['*',' ','*',' ','*',' ','*',' ','*',' ','*'],
             ['X','X','X','X','X','X','X','X',' ','X',' '],
             ['*',' ','*',' ','*',' ','*',' ','*','X','*'],
             [' ','X','X','X','X','X',' ','X','X','X','X'],
             ['*',' ','*','X','*',' ','*','X','#',' ','*'],
             [' ','X',' ','X','X','X','X','X',' ','X',' '],
             ['*','X','*',' ','*',' ','*','X','*','X','*'],
             [' ','X','X','X','X','X',' ','X','X','X',' '],
             ['*','X','*',' ','*',' ','*',' ','*','X','*'],
             [' ','X',' ','X','X','X','X','X','X','X',' '],
             ['*','X','*',' ','*',' ','#',' ','*',' ','*']]

  @maze_6 = [['*','X','*',' ','*','X','*',' ','#',' ','*'],
             [' ','X',' ','X',' ','X','X','X',' ','X',' '],
             ['*','X','*','X','*','X','*',' ','*','X','*'],
             [' ','X',' ','X',' ','X',' ','X','X','X',' '],
             ['*',' ','*','X','*','X','*','X','*',' ','*'],
             [' ','X','X','X','X','X',' ','X',' ','X','X'],
             ['*',' ','*','X','*',' ','*','X','*','X','*'],
             ['X','X',' ','X',' ','X',' ','X',' ','X',' '],
             ['*',' ','*','X','#','X','*','X','*',' ','*'],
             [' ','X','X','X','X','X',' ','X','X','X',' '],
             ['*',' ','*',' ','*',' ','*','X','*',' ','*']]

  @maze_7 = [['*',' ','#',' ','*',' ','*','X','*',' ','*'],
             [' ','X','X','X','X','X',' ','X',' ','X',' '],
             ['*','X','*',' ','*','X','*',' ','*','X','*'],
             [' ','X',' ','X','X','X','X','X','X','X',' '],
             ['*',' ','*','X','*',' ','*','X','*',' ','*'],
             ['X','X','X','X',' ','X','X','X',' ','X','X'],
             ['*',' ','*','X','*',' ','*',' ','*','X','*'],
             [' ','X',' ','X',' ','X','X','X','X','X',' '],
             ['*','X','*','X','*',' ','*',' ','*','X','*'],
             [' ','X','X','X','X','X','X','X',' ','X',' '],
             ['*',' ','#',' ','*',' ','*',' ','*',' ','*']]

  @maze_8 = [['*','X','*',' ','*',' ','#','X','*',' ','*'],
             [' ','X',' ','X','X','X',' ','X',' ','X',' '],
             ['*',' ','*',' ','*','X','*',' ','*','X','*'],
             [' ','X','X','X','X','X','X','X','X','X',' '],
             ['*','X','*',' ','*',' ','*',' ','*','X','*'],
             [' ','X',' ','X','X','X','X','X',' ','X',' '],
             ['*','X','*',' ','#','X','*',' ','*',' ','*'],
             [' ','X','X','X',' ','X','X','X','X','X','X'],
             ['*','X','*','X','*',' ','*',' ','*',' ','*'],
             [' ','X',' ','X','X','X','X','X','X','X','X'],
             ['*',' ','*',' ','*',' ','*',' ','*',' ','*']]

  @maze_9 = [['*','X','*',' ','*',' ','*',' ','*',' ','*'],
             [' ','X',' ','X','X','X','X','X',' ','X',' '],
             ['*','X','*','X','#',' ','*','X','*','X','*'],
             [' ','X',' ','X',' ','X','X','X',' ','X',' '],
             ['*',' ','*',' ','*','X','*',' ','*','X','*'],
             [' ','X','X','X','X','X',' ','X','X','X',' '],
             ['*','X','*','X','*',' ','*','X','*',' ','*'],
             [' ','X',' ','X',' ','X','X','X','X','X',' '],
             ['#','X','*','X','*','X','*',' ','*','X','*'],
             [' ','X',' ','X',' ','X',' ','X',' ','X','X'],
             ['*',' ','*','X','*',' ','*','X','*',' ','*']]

  @mazes = [@maze_1, @maze_2, @maze_3,
            @maze_4, @maze_5, @maze_6,
            @maze_7, @maze_8, @maze_9]

  def traverse(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, current_path = [], previous_direction = nil)

    held_path = Array.new(current_path)

    if startpoint_x == endpoint_x && startpoint_y == endpoint_y
      output_found_path(current_path)
    end

    case previous_direction
    when 'down'
      move_down(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path)
      move_left(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path)
      move_right(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path)
    when 'up'
      move_up(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path)
      move_left(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path)
      move_right(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path)
    when 'left'
      move_up(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_down(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_left(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
    when 'right'
      move_up(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_down(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_right(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
    when nil
      move_up(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_down(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_left(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
      move_right(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, held_path) 
    end
  end

  def move_up(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, current_path)
    if startpoint_y - 1 < 0 || maze[startpoint_y - 1][startpoint_x] == 'X'
      return false
    else
      previous_direction = "up"
      if ['*', '#'].include?(maze[startpoint_y - 1][startpoint_x])
        current_path.push('up')
      end
      traverse(maze, startpoint_x, startpoint_y - 1, endpoint_x, endpoint_y, current_path, previous_direction)
    end
  end

  def move_down(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, current_path)
    if startpoint_y + 1 > 10 || maze[startpoint_y + 1][startpoint_x] == 'X'
      return false
    else
      previous_direction = "down"
      if ['*', '#'].include?(maze[startpoint_y + 1][startpoint_x])
        current_path.push('down')
      end
      traverse(maze, startpoint_x, startpoint_y + 1, endpoint_x, endpoint_y, current_path, previous_direction)
    end
  end

  def move_left(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, current_path)
    if startpoint_x - 1 < 0 || maze[startpoint_y][startpoint_x - 1] == 'X'
      return false
    else
      previous_direction = "left"
      if ['*', '#'].include?(maze[startpoint_y][startpoint_x - 1])
        current_path.push('left')
      end
      traverse(maze, startpoint_x - 1, startpoint_y, endpoint_x, endpoint_y, current_path, previous_direction)
    end
  end

  def move_right(maze, startpoint_x, startpoint_y, endpoint_x, endpoint_y, current_path)
    if startpoint_x + 1 > 10 || maze[startpoint_y][startpoint_x + 1] == 'X'
      return false
    else
      previous_direction = "right"
      if ['*', '#'].include?(maze[startpoint_y][startpoint_x + 1])
        current_path.push('right')
      end
      traverse(maze, startpoint_x + 1, startpoint_y, endpoint_x, endpoint_y, current_path, previous_direction)
    end
  end

  def recognize_input
    configuration = Pocketsphinx::Configuration::Grammar.new('grammars/mazes.gram')
    Pocketsphinx::LiveSpeechRecognizer.new(configuration).recognize do |coord|
      return coord
    end
  end

  def prompt_mazes
    Speech.new("Where is the first circle?").speak
    circle_one = parse_input(recognize_input)
    Speech.new("Second circle?").speak
    circle_two = parse_input(recognize_input)
    maze = determine_maze(circle_one, circle_two)
    Speech.new("White square?").speak
    startpoint = parse_input(recognize_input)
    Speech.new("Red triangle?").speak
    endpoint = parse_input(recognize_input)
    return traverse(maze, startpoint[0], startpoint[1], endpoint[0], endpoint[1])
  end

  def parse_input(input)
    input = input.split(' ')
    input.each_with_index do |number, index|
      case number
      when 'one'
        input[index] = 1
      when 'two'
        input[index] = 2
      when 'three'
        input[index] = 3
      when 'four'
        input[index] = 4
      when 'five'
        input[index] = 5
      when 'six'
        input[index] = 6
      end
    end

    x = input[0] - 1
    y = input[1] - 1
    return [x*2, y*2]
  end

  def determine_maze(circle_one, circle_two)
    @mazes.each do |maze|
      if maze[circle_one[1]][circle_one[0]] == '#' && maze[circle_two[1]][circle_two[0]] == '#'
        return maze
      end
    end
    Speech.new("Incorrect.")
    return prompt_mazes
  end

  def output_found_path(path)
    count = 0
    three_directions = ""
    path.each do |direction|
      three_directions += direction + " "
      count += 1
      if count % 3 == 0
        Speech.new(three_directions).speak
        three_directions = ""
      end
    end
    return
  end
end
