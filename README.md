# Charlie: A Keep Talking and Nobody Explodes AI Partner

## Development Notes
Speech detection incorporates pocketsphinx-ruby, a Ruby wrapper for CMUSphinx by Carnegie Mellon University.

Text-to-speech incorporates espeak.

## Installation

Regardless of your operating system, you'll need your ruby environment set up first. Specifically, you'll need Ruby, rbenv, and Bundler ```gem install bundler```.

### OSX
Install homebrew.
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install rbenv. ```brew install rbenv```

Install bundler. ```gem install bundler```

Next, install pocketsphinx-ruby's dependencies for voice recognition. (More detailed instructions here: https://github.com/watsonbox/pocketsphinx-ruby#installation)
```
$ brew tap watsonbox/cmu-sphinx
$ brew install --HEAD watsonbox/cmu-sphinx/cmu-sphinxbase
$ brew install --HEAD watsonbox/cmu-sphinx/cmu-pocketsphinx
```

Next, install espeak.
```
$ brew install espeak
```

Next, make sure that homebrew has linked the 'portaudio' keg. Run ```brew doctor``` and check for this error:
```
Warning: You have unlinked kegs in your Cellar
Leaving kegs unlinked can lead to build-trouble and cause brews that depend on
those kegs to fail to run properly once built. Run `brew link` on these:
    portaudio
```
If you see this error, run ```brew link portaudio``` to fix it.

Finally, navigate to the ktane_voice folder and run the following command:
```
$ bundle
```

You should now be able to launch Charlie.
```
$ ruby charlie.rb
```

### Windows (Untested)
Download and install Pocketsphinx, Sphinxbase, and Espeak from the 3 links below.
https://sourceforge.net/projects/cmusphinx/files/pocketsphinx/5prealpha/
https://sourceforge.net/projects/cmusphinx/files/sphinxbase/5prealpha/
http://espeak.sourceforge.net/download.html

Then, navigate to the ktane_voice folder and run the following command:
```
$ bundle
```

You should now be able to launch Charlie.
```
$ ruby charlie.rb
```

Have fun!! Please leave issue tickets if these instructions don't work for you! :)

## Modules
Each module has a keyword to select it from the main menu, then commands that will give the bot the appropriate data to solve the module.

The bomb will prompt you for bomb variables the first time that they're necessary. It's recommended when playing expert bombs, however, to say "charlie bomb check" at the beginning of the game to get them all out of the way.

If Charlie isn't responding accurately, TURN DOWN YOUR MIC SENSITIVITY. Currently, Charlie is really sensitive to background noise and static. He doesn't like those at all.

### Bomb Check
KEYWORD "charlie bomb check"

```
batteries (0-9)        - Number of batteries
digit (0-9)            - Last digit of the serial number
vowel (yes/no)         - Vowel in the serial number
car (yes/no)           - lit CAR indicator
freak (yes/no)         - lit FRK indicator
parallel port (yes/no) - Parallel port
```

### On the subject of Wires
##### KEYWORD
```
defuse wires
```
##### USAGE
```
((black/blue/red/white/yellow) wire) [repeat]
```
##### EXAMPLE
```
black wire blue wire white wire
```

### On the subject of Keypads
##### KEYWORD
```
defuse keypads
```
##### USAGE
```
Say the list of keypads, prefixing each with the word 'key'.
```
##### EXAMPLE
```
key inkblot, key six, key spaceship, key paragraph
```
Image | Keypad | Image | Keypad | Image | Keypad
------------ | ------------- | ------------- | ------------- | ------------- | -------------
![balloon](/keypadkeys/ballon.png/) | balloon | ![white star](/keypadkeys/white_star.png/) | white star | ![smiley face](/keypadkeys/smiley_face.png/) | smiley face
![pyramid](/keypadkeys/pyramid.png/) | pyramid | ![question mark](/keypadkeys/question_mark.png/) | question mark | ![trident](/keypadkeys/trident.png/) | trident
![lambda](/keypadkeys/lambda.png/) | lambda | ![copyright](/keypadkeys/copyright.png/) | copyright | ![c square](/keypadkeys/c_square.png/) | c square
![lightning](/keypadkeys/lightning.png/) | lightning | ![butt](/keypadkeys/butt.png/) | butt | ![black star](/keypadkeys/black_star.png/) | black star
![spaceship](/keypadkeys/spaceship.png/) | spaceship | ![inkblot](/keypadkeys/inkblot.png/) | inkblot | ![snake](/keypadkeys/snake.png/) | snake
![letter h](/keypadkeys/letter_h.png/) | letter h | ![half r](/keypadkeys/half_r.png/) | half r | ![hash](/keypadkeys/hash.png/) | hash
![backward c](/keypadkeys/backward_c.png/) | backward c | ![six](/keypadkeys/six.png/) | six | ![a e together](/keypadkeys/a_e_together.png/) | a e together
![letter e](/keypadkeys/letter_e.png/) | letter e | ![paragraph](/keypadkeys/paragraph.png/) | paragraph | ![letter n](/keypadkeys/letter_n.png/) | letter n
![curly fry](/keypadkeys/curly_fry.png/) | curly fry | ![upside down p](/keypadkeys/upside_down_p.png/) | upside down p | ![omega](/keypadkeys/omega.png/) | omega

### On the subject of the Button
##### KEYWORD
```
defuse button
```
##### USAGE
```
Say the color, then the word. If the button is held, say the colour of the stripe.
```
##### EXAMPLE
```
red abort... (HOLD THE BUTTON. STRIPE COLOUR?)... yellow
```

### On the subject of Simon Says
##### KEYWORD
```
defuse simon
```
##### USAGE
```
Say the light colour sequence, followed by 'done'.
```
##### EXAMPLE
```
red blue green green yellow done
```

### On the subject of Complicated Wires
##### KEYWORD
```
defuse complicated
```
##### USAGE
```
Say the combination of attributes (red, blue, star, light) in any order, followed by 'next' to move to the next wire, and done to finish.
```
##### EXAMPLE
```
red blue star, next, nothing, next, blue, next, red light blue, done
```

### On the subject of Wire Sequences
##### KEYWORD
```
defuse sequence
```
##### USAGE
```
From top to bottom, say the colour, then the the letter (Alpha, Bravo, Charlie) that it is connected to. Say 'next' to move to the next wire, 'done' to finish. Cut accordingly.
```
##### EXAMPLE
```
red bravo next, red charlie next, black alpha done
```

### On the subject of Memory
##### KEYWORD
```
defuse memory
```
##### USAGE
```
Say 'sequence', followed by the sequence of numbers, starting with the display number and working from left to right. The keyword must be repeated for each round.
```
##### EXAMPLE
```
defuse memory (ROUND ONE) sequence 3 2 4 3 1
defuse memory (ROUND TWO) sequence 2 2 1 3 4
```

### On the subject of Mazes
##### KEYWORD
```
defuse mazes
```
##### USAGE
```
With the top-left coordinate as (1,1); the bottom right as (6,6), give the locations requested. The circles can be given in either order. (x, y)
```
##### EXAMPLE
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
##### KEYWORD
```
defuse morse code
```
##### USAGE
```
Say the combination of 'dot' and 'dash', then 'next'. Really enunciate the difference between 'dot' and 'dash'.
```
##### EXAMPLE
```
dot dot dot next (S)
```
##### NOTE
```
The letters can be spoken in any order. If you believe an error was made, 'escape morse code', 'reset morse code', then start over by saying 'defuse morse code'.
```

### On the subject of Who's on First?
##### KEYWORD
```
defuse words
```
##### USAGE
```
Say the word in the display. The bot will give you a position. Say the word in that position. The bot will read you a list of words; press the first one you hear that is a button label.
```
##### EXAMPLE
```
The word is YES.
(MIDDLE-LEFT)
The word is NEXT.
```
##### WORD LIST

###### Display words
```
you are   --  you are words
first     --  first
okay      --  okay
c         --  c letter
yes       --  yes
nothing   --  nothing
led       --  L E D
they are  --  they are words
blank     --  blank
read      --  read a book
red       --  red color
you       --  you word
your      --  your possessive
you're    --  you're contraction
their     --  their possessive
_____     --  empty
reed      --  reed instrument
leed      --  leeds england
they're   --  they're contraction
display   --  display
says      --  says
no        --  no
lead      --  lead guitar
hold on   --  hold on
you are   --  you are words
there     --  there location
see       --  see a movie
cee       --  cee word
```

###### Button Words
```
ready    --  ready
first    --  first
no       --  no
blank    --  blank
nothing  --  nothing
yes      --  yes
what     --  what statement
what?    --  what question
uhhh     --  U H H H
left     --  left
right    --  right
middle   --  middle
okay     --  okay
wait     --  wait
press    --  press
you      --  you word
you are  --  you are words
your     --  your possessive
you're   --  you're contraction
u r      --  u r letters
u        --  u letter
uh huh   --  uh huh
uh uh    --  staccato
done     --  done
next     --  next
hold     --  hold
sure     --  sure
like     --  like
```

### On the subject of Passwords
KEYWORD
```
defuse password
```
USAGE
```
First, select a column.
Using the Nato Phonetic Alphabet, say all the letters in one column. If a result is found, the bot will read it. If not, it will prompt you for another column.
```
EXAMPLE
```
one (selecting column one)
alpha foxtrot whiskey quebec tango echo
```

### On the subject of the Knob
KEYWORD
```
defuse knob
```
USAGE
```
From left to right, say the sequence of light combinations.
```
EXAMPLE
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
