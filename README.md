# Charlie: A Keep Talking and Nobody Explodes AI Partner

## Installation
Compatible with all operating systems that can run a ruby environment.

### OSX
```
bundle
ruby charlie.rb
```

### Other
Same as above, but pocketsphinx-ruby's dependencies (Pocketsphinx and CMUSphinx) are not included. More detailed instructions to come.


## Development Notes
Speech detection incorporates pocketsphinx-ruby, a Ruby wrapper for CMUSphinx by Carnegie Mellon University.

Text-to-speech incorporates espeak.

Currently, the bomb check MUST be done first. If a module requiring bomb parameters is selected, the app will crash. Soon it will prompt you for missing data when it's needed; I'm still porting this feature from the text-based defuser.

## Modules
Each module has a keyword to select it from the main menu, then commands that will give the bot the appropriate data to solve the module.

## Reset Commands
```
reset wire sequences      - resets wire sequences
reset password            - resets password
reset memory              - resets memory
```
Make sure to run reset commands before solving a second module of the same type.

## Success/Failure Commands
```
The bomb is defused. / We did it!        - cue a happy success response
The bomb detonated. / The bomb blew up.  - cue an upset failure response
```

### Bomb Check
keyword: "Bomb Check"

```
batteries (0-9)        - Number of batteries
digit (0-9)            - Last digit of the serial number
vowel (yes/no)         - Vowel in the serial number
car (yes/no)           - lit CAR indicator
freak (yes/no)         - lit FRK indicator
parallel port (yes/no) - Parallel port
```

### On the subject of Wires
keyword:
```
defuse wires
```
usage:
```
((black/blue/red/white/yellow) wire) [repeat]
```
example:
```
black wire blue wire white wire
```

### On the subject of Keypads
keyword:
```
defuse keypads
```
usage:
```
Say the list of keypads, prefixing each with the word 'key'.
```
example:
```
key inkblot, key six, key spaceship, key paragraph
```
<symbol>
List coming soon.

### On the subject of the Button
keyword:
```
defuse button
```
usage:
```
Say the color, then the word. If the button is held, say the colour of the stripe.
```
example:
```
red abort... (HOLD THE BUTTON. STRIPE COLOUR?)... yellow
```

### On the subject of Simon Says
keyword:
```
defuse simon
```
usage:
```
Say the light colour sequence, followed by 'done'.
```
example:
```
red blue green green yellow done
```

### On the subject of Complicated Wires
keyword:
```
defuse complicated
```
usage:
```
Say the combination of attributes (red, blue, star, light) in any order, followed by 'next' to move to the next wire, and done to finish.
```
example:
```
red blue star, next, nothing, next, blue, next, red light blue, done
```

### On the subject of Wire Sequences
keyword:
```
defuse sequence
```
usage:
```
From top to bottom, say the colour, then the the letter (Alpha, Bravo, Charlie) that it is connected to. Say 'next' to move to the next wire, 'done' to finish. Cut accordingly.
```
example:
```
red bravo next, red charlie next, black alpha done
```

### On the subject of Memory
keyword:
```
defuse memory
```
usage:
```
Say 'sequence', followed by the sequence of numbers, starting with the display number and working from left to right. The keyword must be repeated for each round.
```
example:
```
defuse memory (ROUND ONE) sequence 3 2 4 3 1
defuse memory (ROUND TWO) sequence 2 2 1 3 4
```

### On the subject of Mazes
keyword:
```
defuse mazes
```
usage:
```
With the top-left coordinate as (1,1); the bottom right as (6,6), give the locations requested. The circles can be given in either order. (x, y)
```
example:
```
(FIRST CIRCLE?)
1 1
(SECOND CIRCLE?)
1 4
(WHITE SQUARE?)
3 3
(RED TRIANGLE?)
6 6

O * * * * *
* * * * * *
* * X * * *
O * * * * *
* * * * * *
* * * * * A
```

### On the subject of Morse Code
keyword:
```
defuse morse code
```
usage:
```
Say 'code', followed by the combination of 'blip' and 'dash', then 'next'
```
example:
```
code blip blip blip next (S)
```
note:
```
The letters can be spoken in any order.
There is currently no escaping this module in the middle. If an error is made... well... you're out of luck. Fix coming very soon.
```

### On the subject of Who's on First?
keyword:
```
defuse words
```
usage:
```
Say the word in the display. The bot will give you a position. Say the word in that position. The bot will read you a list of words; press the first one you hear that is a button label.
```
example:
```
The word is YES.
(MIDDLE-LEFT)
The word is NEXT.
```
note:
```
Many words have nicknames. I'll post the list here soon; read the source code for now.
```

### On the subject of Passwords
keyword:
```
defuse password
```
usage:
```
First, select a column.
Using the Nato Phonetic Alphabet, say all the letters in one column. If a result is found, the bot will read it. If not, it will prompt you for another column.
```
example:
```
one (selecting column one)
alpha foxtrot whiskey quebec tango echo
```
note:
```
There is no escape from this module until a password is found. Fix coming soon.
```

### On the subject of the Knob
keyword:
```
defuse knob
```
usage:
```
From left to right, say the sequence of light combinations.
```
example:
```
up down both none both down (UP)
```