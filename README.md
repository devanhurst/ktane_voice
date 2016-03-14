# Charlie: A Keep Talking and Nobody Explodes AI Partner

## Installation
Compatible with all operating systems that can run a ruby environment. The instructions below work for OSX, but may not work for your OS of choice. Feel free to leave an issue ticket!

You'll need your ruby environment set up first. Specifically, you'll need Ruby, Bundler, and Homebrew.

Next, install pocketsphinx-ruby's dependencies for voice recognition. (More detailed instructions here: https://github.com/watsonbox/pocketsphinx-ruby#installation)

```
$ brew tap watsonbox/cmu-sphinx
$ brew install --HEAD watsonbox/cmu-sphinx/cmu-sphinxbase
$ brew install --HEAD watsonbox/cmu-sphinx/cmu-sphinxtrain
$ brew install --HEAD watsonbox/cmu-sphinx/cmu-pocketsphinx
```

Next, install espeak.
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
$ brew install espeak
```

Next, make sure that homebrew has linked the 'portaudio' keg. Run ```brew doctor``` and check for this error:
```
Warning: You have unlinked kegs in your Cellar
Leaving kegs unlinked can lead to build-trouble and cause brews that depend on
those kegs to fail to run properly once built. Run `brew link` on these:
    portaudio
```
If you see this error, follow the instructions to link portaudio.

Finally, navigate to the ktane_voice folder and run the following command:
```
$ bundle
```

You should now be able to launch Charlie.
```
$ ruby charlie.rb
```

Have fun!!

## Development Notes
Speech detection incorporates pocketsphinx-ruby, a Ruby wrapper for CMUSphinx by Carnegie Mellon University.

Text-to-speech incorporates espeak.

## Modules
Each module has a keyword to select it from the main menu, then commands that will give the bot the appropriate data to solve the module.

The bomb will prompt you for bomb variables the first time that they're necessary. It's recommended when playing expert bombs, however, to say "charlie bomb check" at the beginning of the game to get them all out of the way.

### Bomb Check
keyword: "charlie bomb check"

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
Say the combination of 'dot' and 'dash', then 'next'. Really enunciate the difference between 'dot' and 'dash'.
```
example:
```
dot dot dot next (S)
```
note:
```
The letters can be spoken in any order. If you believe an error was made, 'escape morse code', 'reset morse code', then start over by saying 'defuse morse code'.
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
### Adding/Removing Strikes
On the main menu:
```
add a strike
remove a strike
```

### Reset Commands
```
reset wire sequences      - resets wire sequences
reset morse code          - resets morse code
reset password            - resets password
reset memory              - resets memory
```
Upon successful completion of these modules, they reset automatically. It isn't necessary to run these commands unless an error was made.

### Undo Commands
```
undo last wire sequence    - removes the previous spoken wire sequence command
```

### Success/Failure Commands
```
The bomb is defused. / We did it!        - cue a happy success response
The bomb detonated. / The bomb blew up.  - cue an upset failure response
```