---
layout: post
title: Introduction To Ruby
date: '2022-04-01 16:13:06 +0530'
tags: ruby programming
---

{% include toc.jekyll %}

## Numbers : Chapter 1

Ruby Hello World Program

```ruby
puts "Hello World"
```

Save and run the file.
`ruby calc.rb`

### Introduction to puts

```ruby
puts 1+2
```

puts simply writes onto the screen whatever comes after it.

### Integer and Float

Numbers without decimal points are called _integers_, and numbers with decimal points are called _floating-point numbers_.

Here are some integers:

```ruby
5
-205
9999999999999999999999999
0
```

Here are some floats:

```ruby
54.321
0.001
-205.3884
0.0
```

### Simple Arithmetic

Let's do some simple arithmetic:

```ruby
puts 1.0 + 2.0
puts 2.0 * 3.0
puts 5.0 - 8.0
puts 9.0 / 2.0
```

Program result:

```text
3.0
6.0
-3.0
4.5
```

Let's try it with integers:

```ruby
puts 1+2
puts 2*3
puts 5-8
puts 9/2
```

Program result:

```text
3
6
-3
4
```

Complex arithmetic expressions can be written using the following operators:

```ruby
puts 5 * (12-8) + -15
puts 98 + (59872 / (13*8)) * -52
```

```text
5
-29802
```

## Letters : Chapter 2

Some strings are:

```ruby
'Hello.'
'Ruby rocks.'
'5 is my favorite number... what is yours?'
'Snoopy says #%^?&*@! when he stubs his toe.'
'     '
''
```

Strings can have punctuation, digits, symbols, and spaces in them... more than just letters.

Let's try it with some strings:

```ruby
puts 'Hello, world!'
puts ''
puts 'Good-bye.'
```

```text
Hello, world!

Good-bye.
```

### String Arithmetic

Adding or concatenating strings is easy:

```ruby
puts 'I like' + 'apple pie.'
```

```text
I likeapple pie.
```

```ruby
puts 'I like ' + 'apple pie.'
puts 'I like' + ' apple pie.'
```

```text
I like apple pie.
I like apple pie.
```

We can multiply them

```ruby
puts 'blink ' * 4
```

```text
blink blink blink blink
```

### 12 vs '12'

12 is a number, but '12' is a string of two digits.

```ruby
puts  12  +  12
puts '12' + '12'
puts '12  +  12'
```

```text
24
1212
12  +  12
```

```ruby
puts  2  *  5
puts '2' *  5
puts '2  *  5'
```

```text
10
22222
2  *  5
```

### Problems

```ruby
puts '12' + 12
puts '2' * '5'
```

```text
#<TypeError: no implicit conversion of Integer into String>
```

```ruby
puts 'You're swell!'
```

The computer thought we were done with the string. (This is why it's nice to have a text editor which does syntax coloring for you.)

```ruby
puts 'You\'re swell!'
```

```text
You're swell!
```

```ruby
puts 'You\'re swell!'
puts 'backslash at the end of a string:  \\'
puts 'up\\down'
puts 'up\down'
```

The backslash is the escape character. In other words, if you have a backslash and another character, they are sometimes translated into a new character.

```text
You're swell!
backslash at the end of a string:  \
up\down
up\down
```

## Variables and Assignment : Chapter 3

We wanted to print something out twice, we would have to type it in twice:

```ruby
puts '...you can say that again...'
puts '...you can say that again...'
```

```text
...you can say that again...
...you can say that again...
```

Assigning a value to a variable is called _assignment_.

```ruby
myString = '...you can say that again...'
puts myString
puts myString
```

```text
...you can say that again...
...you can say that again...
```

```ruby
name = 'Patricia Rosanna Jessica Mildred Oppenheimer'
puts 'My name is ' + name + '.'
puts 'Wow!  ' + name + ' is a really long name!'
```

```text
My name is Patricia Rosanna Jessica Mildred Oppenheimer.
Wow!  Patricia Rosanna Jessica Mildred Oppenheimer is a really long name!
```

We can assign an object to a variable, we can reassign a different object to that variable.

```ruby
composer = 'Mozart'
puts composer + ' was "da bomb", in his day.'

composer = 'Beethoven'
puts 'But I prefer ' + composer + ', personally.'
```

```text
Mozart was "da bomb", in his day.
But I prefer Beethoven, personally.
```

Variables can point to any kind of object, not just strings:

```ruby
var = 'just another ' + 'string'
puts var

var = 5 * (1+2)
puts var
```

```text
just another string
15
```

Variables can point to just about anything... except other variables.

```ruby
var1 = 8
var2 = var1
puts var1
puts var2

puts ''

var1 = 'eight'
puts var1
puts var2
```

```text
8
8

eight
8
```

## Mixing it all up : Chapter 4

```ruby
var1 = 2
var2 = '5'

puts var1 + var2
```

If you were trying to get 7 (2 + 5), or if you wanted to get 25 ('2' + '5').

### Conversions

To get the string version of an object, we simply write .`to_s` after it:

```ruby
var1 = 2
var2 = '5'

puts var1.to_s + var2
```

```text
25
```

Similarly, `to_i` gives the integer version of an object, and `to_f` gives the float version.

```ruby
var1 = 2
var2 = '5'

puts var1.to_s + var2
puts var1 + var2.to_i
```

```text
25
7
```

Other conversions:

```ruby
puts '15'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i
puts 'Who asked you about 5 or whatever?'.to_i
puts 'Your momma did.'.to_f
puts ''
puts 'stringy'.to_s
puts 3.to_i
```

```text
15.0
99.999
99

5
0
0.0

stringy
3
```

The first one is pretty standard, giving 15.0. After that, we converted the string '99.999' to a float and to an integer.

### Another Look at puts

```ruby
puts 20
puts 20.to_s
puts '20'
```

```text
20
20
20
```

Before puts tries to write out an object, it uses to_s to get the string version of that object. In fact, the s in puts stands for string; puts really means put string.

### The Methods gets and chomp

Since our keyboard only makes strings, that works out beautifully. What actually happens is that gets just sits there, reading what we type until we press Enter.

```ruby
puts gets
```

```text
Is there an echo in here?
Is there an echo in here?
```

In this one, type in your name and it will greet you:

```ruby
puts 'Hello there, and what\'s your name?'
name = gets
puts 'Your name is ' + name + '?  What a lovely name!'
puts 'Pleased to meet you, ' + name + '.  :)'
```

```text
Hello there, and what's your name?
Chris
Your name is Chris
?  What a lovely name!
Pleased to meet you, Chris
.  :)
```

When I typed in the letters C, h, r, i, s, and then pressed Enter, gets got all of the letters in my name and the Enter! Let's try that program again, but with chomp to help us this time:

```ruby
puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is ' + name + '?  What a lovely name!'
puts 'Pleased to meet you, ' + name + '.  :)'
```

```text
Hello there, and what's your name?
Chris
Your name is Chris?  What a lovely name!
Pleased to meet you, Chris.  :)
```

## More About Methods : Chapter 5

As it turns out, 5 + 5 is really just a shortcut way of writing 5.+ 5.

```ruby
puts 'hello '.+ 'world'
puts (10.* 9).+ 9
```

```text
hello world
99
```

On older versions of Ruby, this code might also give a warning: warning: parenthesize argument(s) for future version. It would still run the code just fine, though.

So what is self? It's a special variable which points to whatever object you are in.

```ruby
iCantBelieveIMadeAVariableNameThisLongJustToPointToA3 = 3
puts iCantBelieveIMadeAVariableNameThisLongJustToPointToA3
self.puts iCantBelieveIMadeAVariableNameThisLongJustToPointToA3
```

```text
3
3
```

### Fancy String Methods

So, our first string method is reverse, which gives a backwards version of a string:

```ruby
var1 = 'stop'
var2 = 'stressed'
var3 = 'Can you pronounce this sentence backwards?'

puts var1.reverse
puts var2.reverse
puts var3.reverse
puts var1
puts var2
puts var3
```

```text
pots
desserts
?sdrawkcab ecnetnes siht ecnuonorp uoy naC
stop
stressed
Can you pronounce this sentence backwards?
```

Another string method is length, which tells us the number of characters (including spaces) in the string:

```ruby
puts 'What is your full name?'
name = gets.chomp
puts 'Did you know there are ' + name.length +
     ' characters in your name, ' + name + '?'
```

```text
What is your full name?
Christopher David Pine
#<TypeError: no implicit conversion of Integer into String>
```

swapcase switches the case of every letter in the string, and finally, capitalize is just like downcase, except that it switches the first character to uppercase (if it is a letter).

```ruby
letters = 'aAbBcCdDeE'
puts letters.upcase
puts letters.downcase
puts letters.swapcase
puts letters.capitalize
puts ' a'.capitalize
puts letters
```

```text
AABBCCDDEE
aabbccddee
AaBbCcDdEe
Aabbccddee
 a
aAbBcCdDeE
```

So if I wanted to center the lines of a poem, I would do it like this:

```ruby
lineWidth = 50
puts(                'Old Mother Hubbard'.center(lineWidth))
puts(               'Sat in her cupboard'.center(lineWidth))
puts(         'Eating her curds an whey,'.center(lineWidth))
puts(          'When along came a spider'.center(lineWidth))
puts(         'Which sat down beside her'.center(lineWidth))
puts('And scared her poor shoe dog away.'.center(lineWidth))
```

```text
                Old Mother Hubbard
               Sat in her cupboard
            Eating her curds an whey,
             When along came a spider
            Which sat down beside her
        And scared her poor shoe dog away.
```

The other two string formatting methods are ljust and rjust, which stand for left justify and right justify. They are similar to center, except that they pad the string with spaces on the right and left sides, respectively.

```ruby
lineWidth = 40
str = '--> text <--'
puts str.ljust  lineWidth
puts str.center lineWidth
puts str.rjust  lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)
```

```text
--> text <--
              --> text <--
                            --> text <--
--> text <--                --> text <--
```

#### Problems - 5

-   Write an Angry Boss program. It should rudely ask what you want. Whatever you answer, the Angry Boss should yell it back to you, and then fire you. For example, if you type in `I want a raise.`, it should yell back `WHADDAYA MEAN "I WANT A RAISE."?!? YOU'RE FIRED!!`

-   So here's something for you to do in order to play around more with center, ljust, and rjust: Write a program which will display a Table of Contents so that it looks like this:

```text
                    Table of Contents

    Chapter 1:  Numbers                        page 1
    Chapter 2:  Letters                       page 72
    Chapter 3:  Variables                    page 118
```

### Higher Math

We'll look at the rest of the arithmetic methods, a random number generator, and the Math object, with its trigonometric and transcendental methods.

The other two arithmetic methods are \*\* (exponentiation) and % (modulus).

```ruby
puts 5**2
puts 5**0.5
puts 7/3
puts 7%3
puts 365%7
```

```text
25
2.23606797749979
2
1
1
```

It just takes the absolute value of the number:

```ruby
puts((5-2).abs)
puts((2-5).abs)
```

```text
3
3
```

### Random Numbers

If we call rand just like that, we'll get a float greater than or equal to 0.0 and less than 1.0. If we give rand an integer (5 for example), it will give we an integer greater than or equal to 0 and less than 5 (so five possible numbers, from 0 to 4).

Let's see rand in action.

```ruby
puts rand
puts rand
puts rand
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(1))
puts(rand(1))
puts(rand(1))
puts(rand(99999999999999999999999999999999999999999999999999999999999))
puts('The weatherman said there is a '+rand(101).to_s+'% chance of rain,')
puts('but you can never trust a weatherman.')
```

```text
0.17429261270690644
0.6038796470847551
0.5357456897902644
82
63
21
0
0
0
93717128025224525218060865578711367433735357080012377789690
The weatherman said there is a 9% chance of rain,
but you can never trust a weatherman.
```

In order to do this, you need to set the seed, which you can do with srand. Like this:

```ruby
srand 1776
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts ''
srand 1776
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
```

```text
24
35
36
58
70

24
35
36
58
70
```

### The Math Object

Finally, let's look at the Math object. We might as well jump right in:

```ruby
puts(Math::PI)
puts(Math::E)
puts(Math.cos(Math::PI/3))
puts(Math.tan(Math::PI/4))
puts(Math.log(Math::E**2))
puts((1 + Math.sqrt(5))/2)
```

```text
3.141592653589793
2.718281828459045
0.5000000000000001
0.9999999999999999
2.0
1.618033988749895
```

## Flow Control : Chapter 6

### Comparison Methods

So, to see if one object is greater than or less than another, we use the methods > and <, like this:

```ruby
puts 1 > 2
puts 1 < 2
```

```text
false
true
```

Likewise, we can find out if an object is greater-than-or-equal-to another (or less-than-or-equal-to) with the methods >= and <=

```ruby
puts 5 >= 5
puts 5 <= 4
```

```text
true
false
```

It's important not to confuse = with ==. = is for telling a variable to point at an object (assignment), and == is for asking the question: "Are these two objects equal?"

```ruby
puts 1 == 1
puts 2 != 1
```

```text
true
true
```

When strings get compared, they compare their lexicographical ordering, which basically means their dictionary ordering. cat comes before dog in the dictionary, so:

```ruby
puts 'cat' < 'dog'
```

```text
true
```

One last note before Branching: The comparison methods aren't giving us the strings 'true' and 'false'; they are giving us the special objects true and false.

### Branching

Branching is a simple concept, but powerful.

```ruby
puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'
if name == 'Chris'
  puts 'What a lovely name!'
end
```

```text
Hello, what's your name?
Chris
Hello, Chris.
What a lovely name!
```

We put in a different name

```text
Hello, what's your name?
Chewbacca
Hello, Chewbacca.
```

If what comes after the if is true, we run the code between the if and the end. If what comes after the if is false, we don't.

Often, we would like a program to do one thing if an expression is true, and another if it is false. That's what else is for:

```ruby
puts 'I am a fortune-teller.  Tell me your name:'
name = gets.chomp
if name == 'Chris'
  puts 'I see great things in your future.'
else
  puts 'Your future is... Oh my!  Look at the time!'
  puts 'I really have to go, sorry!'
end
```

```text
I am a fortune-teller.  Tell me your name:
Chris
I see great things in your future.
```

```text
I am a fortune-teller.  Tell me your name:
Ringo
Your future is... Oh my!  Look at the time!
I really have to go, sorry!
```

```ruby
puts 'Hello, and welcome to 7th grade English.'
puts 'My name is Mrs. Gabbard.  And your name is...?'
name = gets.chomp

if name == name.capitalize
  puts 'Please take a seat, ' + name + '.'
else
  puts name + '?  You mean ' + name.capitalize + ', right?'
  puts 'Don\'t you even know how to spell your name??'
  reply = gets.chomp

  if reply.downcase == 'yes'
    puts 'Hmmph!  Well, sit down!'
  else
    puts 'GET OUT!!'
  end
end
```

```text
Hello, and welcome to 7th grade English.
My name is Mrs. Gabbard.  And your name is...?
chris
chris?  You mean Chris, right?
Don't you even know how to spell your name??
yes
Hmmph!  Well, sit down!
```

```text
Hello, and welcome to 7th grade English.
My name is Mrs. Gabbard.  And your name is...?
Chris
Please take a seat, Chris.
```

Sometimes it might get confusing trying to figure out where all of the ifs, elses, and ends go.

```ruby
puts 'Hello, and welcome to 7th grade English.'
puts 'My name is Mrs. Gabbard.  And your name is...?'
name = gets.chomp

if name == name.capitalize
else
end
```

```ruby
puts 'Hello, and welcome to 7th grade English.'
puts 'My name is Mrs. Gabbard.  And your name is...?'
name = gets.chomp

if name == name.capitalize
  # She's civil.
else
  # She gets mad.
end
```

```ruby
puts 'Hello, and welcome to 7th grade English.'
puts 'My name is Mrs. Gabbard.  And your name is...?'
name = gets.chomp

if name == name.capitalize
  puts 'Please take a seat, ' + name + '.'
else
  puts name + '?  You mean ' + name.capitalize + ', right?'
  puts 'Don\'t you even know how to spell your name??'
  reply = gets.chomp

  if reply.downcase == 'yes'
  else
  end
end
```

### Looping

```ruby
command = ''

while command != 'bye'
  puts command
  command = gets.chomp
end

puts 'Come again soon!'
```

```text
Hello?
Hello?
Hi!
Hi!
Very nice to meet you.
Very nice to meet you.
Oh... how sweet!
Oh... how sweet!
bye
Come again soon!
```

### A Little Bit of Logic

```ruby
puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'
if name == 'Chris'
  puts 'What a lovely name!'
else
  if name == 'Katy'
    puts 'What a lovely name!'
  end
end
```

```text
Hello, what's your name?
Katy
Hello, Katy.
What a lovely name!
```

The DRY rule is Don't Repeat Yourself

```ruby
puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'
if (name == 'Chris' or name == 'Katy')
  puts 'What a lovely name!'
end
```

```text
Hello, what's your name?
Katy
Hello, Katy.
What a lovely name!
```

The other logical operators are and and not.

```ruby
iAmChris  = true
iAmPurple = false
iLikeFood = true
iEatRocks = false

puts (iAmChris  and iLikeFood)
puts (iLikeFood and iEatRocks)
puts (iAmPurple and iLikeFood)
puts (iAmPurple and iEatRocks)
puts
puts (iAmChris  or iLikeFood)
puts (iLikeFood or iEatRocks)
puts (iAmPurple or iLikeFood)
puts (iAmPurple or iEatRocks)
puts
puts (not iAmPurple)
puts (not iAmChris )
```

```text
true
false
false
false

true
true
true
false

true
false
```

### A Few Things to Try : Chapter 6

-   "99 bottles of beer on the wall..." Write a program which prints out the lyrics to that beloved classic, that field-trip favorite: "99 Bottles of Beer on the Wall."

-   Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with HUH?! SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950. (This part is optional, and would be much easier if you read the section on Ruby's random number generator at the end of the methods chapter.) You can't stop talking to grandma until you shout BYE.

    **Hint**: Don't forget about chomp! 'BYE'with an Enter is not the same as 'BYE' without one!

    **Hint 2**: Try to think about what parts of your program should happen over and over again. All of those should be in your while loop.

-   Extend your Deaf Grandma program: What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you. Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma.

-   Leap Years. Write a program which will ask for a starting year and an ending year, and then puts all of the leap years between them (and including them, if they are also leap years). Leap years are years divisible by four (like 1984 and 2004). However, years divisible by 100 are not leap years (such as 1800 and 1900) unless they are divisible by 400 (like 1600 and 2000, which were in fact leap years). (Yes, it's all pretty confusing, but not as confusing as having July in the middle of the winter, which is what would eventually happen.)

## Arrays and Iterators : Chapter 7

An array is just a list in your computer. Every slot in the list acts like a variable: you can see what object a particular slot points to, and you can make it point to a different object. Let's take a look at some arrays:

```ruby
[]
[5]
['Hello', 'Goodbye']

flavor = 'vanilla'             # This is not an array, of course...
[89.9, flavor, [true, false]]  # ...but this is.
```

We would reference the objects in an array:

```ruby
names = ['Ada', 'Belle', 'Chris']

puts names
puts names[0]
puts names[1]
puts names[2]
puts names[3]  # This is out of range.
```

```text
Ada
Belle
Chris
Ada
Belle
Chris
```

### The Method each

If we want to say something nice about each language in the array below, we'd do this:

```ruby
languages = ['English', 'German', 'Ruby']

languages.each do |lang|
  puts 'I love ' + lang + '!'
  puts 'Don\'t you?'
end

puts 'And let\'s hear it for C++!'
puts '...'
```

```text
I love English!
Don't you?
I love German!
Don't you?
I love Ruby!
Don't you?
And let's hear it for C++!
```

They are always followed by do...end. while and if never had a do near them; we only use do with iterators.

```ruby
3.times do
  puts 'Hip-Hip-Hooray!'
end
```

```text
Hip-Hip-Hooray!
Hip-Hip-Hooray!
Hip-Hip-Hooray!
```

### More Array Methods

Let's look at to_s and join. join works much like to_s does, except that it adds a string in between the array's objects. Let's take a look:

```ruby
foods = ['artichoke', 'brioche', 'caramel']

puts foods
puts
puts foods.to_s
puts
puts foods.join(', ')
puts
puts foods.join('  :)  ') + '  8)'

200.times do
  puts []
end
```

```text
artichoke
brioche
caramel

["artichoke", "brioche", "caramel"]

artichoke, brioche, caramel

artichoke  :)  brioche  :)  caramel  8)
```

Let's take a look at push, pop, and last. The methods push and pop are sort of opposites, like + and - are. push adds an object to the end of your array, and pop removes the last object from the array (and tell you what it was). last is similar to pop in that it tells you what's at the end of the array, except that it leaves the array alone. Again, push and pop actually change the array:

```ruby
favorites = []
favorites.push 'raindrops on roses'
favorites.push 'whiskey on kittens'

puts favorites[0]
puts favorites.last
puts favorites.length

puts favorites.pop
puts favorites
puts favorites.length
```

```text
raindrops on roses
whiskey on kittens
2
whiskey on kittens
raindrops on roses
1
```

### A Few Things to Try : Chapter 7

-   Write the program we talked about at the very beginning of this chapter.
    Hint: There's a lovely array method which will give you a sorted version of an array: sort. Use it!

-   Try writing the above program without using the sort method. A large part of programming is solving problems, so get all the practice you can!

-   Rewrite your Table of Contents program (from the chapter on methods). Start the program with an array holding all of the information for your Table of Contents (chapter names, page numbers, etc.). Then print out the information from the array in a beautifully formatted Table of Contents.

## Writing Your Own Methods : Chapter 8

```ruby
puts 'Hello, and thank you for taking the time to'
puts 'help me with this experiment.  My experiment'
puts 'has to do with the way people feel about'
puts 'Mexican food.  Just think about Mexican food'
puts 'and try to answer every question honestly,'
puts 'with either a "yes" or a "no".  My experiment'
puts 'has nothing to do with bed-wetting.'
puts

# We ask these questions, but we ignore their answers.

goodAnswer = false
while (not goodAnswer)
  puts 'Do you like eating tacos?'
  answer = gets.chomp.downcase
  if (answer == 'yes' or answer == 'no')
    goodAnswer = true
  else
    puts 'Please answer "yes" or "no".'
  end
end

goodAnswer = false
while (not goodAnswer)
  puts 'Do you like eating burritos?'
  answer = gets.chomp.downcase
  if (answer == 'yes' or answer == 'no')
    goodAnswer = true
  else
    puts 'Please answer "yes" or "no".'
  end
end

# We pay attention to *this* answer, though.
goodAnswer = false
while (not goodAnswer)
  puts 'Do you wet the bed?'
  answer = gets.chomp.downcase
  if (answer == 'yes' or answer == 'no')
    goodAnswer = true
    if answer == 'yes'
      wetsBed = true
    else
      wetsBed = false
    end
  else
    puts 'Please answer "yes" or "no".'
  end
end

goodAnswer = false
while (not goodAnswer)
  puts 'Do you like eating chimichangas?'
  answer = gets.chomp.downcase
  if (answer == 'yes' or answer == 'no')
    goodAnswer = true
  else
    puts 'Please answer "yes" or "no".'
  end
end

puts 'Just a few more questions...'

goodAnswer = false
while (not goodAnswer)
  puts 'Do you like eating sopapillas?'
  answer = gets.chomp.downcase
  if (answer == 'yes' or answer == 'no')
    goodAnswer = true
  else
    puts 'Please answer "yes" or "no".'
  end
end

# Ask lots of other questions about Mexican food.

puts
puts 'DEBRIEFING:'
puts 'Thank you for taking the time to help with'
puts 'this experiment.  In fact, this experiment'
puts 'has nothing to do with Mexican food.  It is'
puts 'an experiment about bed-wetting.  The Mexican'
puts 'food was just there to catch you off guard'
puts 'in the hopes that you would answer more'
puts 'honestly.  Thanks again.'
puts
puts wetsBed
```

```text
Hello, and thank you for taking the time to
help me with this experiment.  My experiment
has to do with the way people feel about
Mexican food.  Just think about Mexican food
and try to answer every question honestly,
with either a "yes" or a "no".  My experiment
has nothing to do with bed-wetting.

Do you like eating tacos?
yes
Do you like eating burritos?
yes
Do you wet the bed?
no way!
Please answer "yes" or "no".
Do you wet the bed?
NO
Do you like eating chimichangas?
yes
Just a few more questions...
Do you like eating sopapillas?
yes

DEBRIEFING:
Thank you for taking the time to help with
this experiment.  In fact, this experiment
has nothing to do with Mexican food.  It is
an experiment about bed-wetting.  The Mexican
food was just there to catch you off guard
in the hopes that you would answer more
honestly.  Thanks again.

false
```

In situations like these, it's best to write a method. Here's how:

```ruby
def sayMoo
  puts 'mooooooo...'
end

sayMoo
sayMoo
puts 'coin-coin'
sayMoo
sayMoo
```

```text
mooooooo...
mooooooo...
coin-coin
mooooooo...
mooooooo...
```

### Method Parameters

To add a parameter to sayMoo (let's say, the number of moos), we would do this:

```ruby
def sayMoo numberOfMoos
  puts 'mooooooo...'*numberOfMoos
end

sayMoo 3
puts 'oink-oink'
sayMoo  # This should give an error because the parameter is missing.
```

```text
mooooooo...mooooooo...mooooooo...
oink-oink
#<ArgumentError: wrong number of arguments (given 0, expected 1)>
```

numberOfMoos is a variable which points to the parameter passed in. numberOfMoos is a variable which points to the parameter passed in. So if I type in sayMoo 3, then the parameter is 3, and the variable numberOfMoos points to 3.

### Local Variables

In the following program, there are two variables:

```ruby
def doubleThis num
  numTimes2 = num*2
  puts num.to_s+' doubled is '+numTimes2.to_s
end

doubleThis 44
```

```text
44 doubled is 88
```

The variables are num and numTimes2. They both sit inside the method doubleThis.

```ruby
def doubleThis num
  numTimes2 = num*2
  puts num.to_s+' doubled is '+numTimes2.to_s
end

doubleThis 44
puts numTimes2.to_s
```

```text
44 doubled is 88
#<NameError: undefined local variable or method `numTimes2' for #<StringIO:0x00007fc89a08a880>>
```

While it does mean that you have no access to variables inside methods, it also means that they have no access to your variables, and thus can't screw them up:

```ruby
def littlePest var
  var = nil
  puts 'HAHA!  I ruined your variable!'
end

var = 'You can\'t even touch my variable!'
littlePest var
puts var
```

```text
HAHA!  I ruined your variable!
You can't even touch my variable!
```

There are actually two variables in that little program named var: one inside littlePest, and one outside of it.

### Return Values

gets returns a string (the string you typed in), and the + method in 5+3, (which is really 5.+(3)) returns 8. The arithmetic methods for numbers return numbers, and the arithmetic methods for strings return strings.

We never cared before, but let's look at it now:

```ruby
returnVal = puts 'This puts returned:'
puts returnVal
```

```text
This puts returned:
```

If we wanted all of our methods to return the string 'yellow submarine', we would just need to put that at the end of them:

```ruby
def sayMoo numberOfMoos
puts 'mooooooo...'\*numberOfMoos
'yellow submarine'
end

x = sayMoo 2
puts x
```

```text
mooooooo...mooooooo...
yellow submarine
```

It will need to take the question as a parameter, and return true if they answered yes and false if they answered no.

```ruby
def ask question
  goodAnswer = false
  while (not goodAnswer)
    puts question
    reply = gets.chomp.downcase

    if (reply == 'yes' or reply == 'no')
      goodAnswer = true
      if reply == 'yes'
        answer = true
      else
        answer = false
      end
    else
      puts 'Please answer "yes" or "no".'
    end
  end

  answer  # This is what we return (true or false).
end

puts 'Hello, and thank you for...'
puts

ask 'Do you like eating tacos?'      # We ignore this return value.
ask 'Do you like eating burritos?'
wetsBed = ask 'Do you wet the bed?'  # We save this return value.
ask 'Do you like eating chimichangas?'
ask 'Do you like eating sopapillas?'
ask 'Do you like eating tamales?'
puts 'Just a few more questions...'
ask 'Do you like drinking horchata?'
ask 'Do you like eating flautas?'

puts
puts 'DEBRIEFING:'
puts 'Thank you for...'
puts
puts wetsBed
```

```text
Hello, and thank you for...

Do you like eating tacos?
yes
Do you like eating burritos?
yes
Do you wet the bed?
no way!
Please answer "yes" or "no".
Do you wet the bed?
NO
Do you like eating chimichangas?
yes
Do you like eating sopapillas?
yes
Do you like eating tamales?
yes
Just a few more questions...
Do you like drinking horchata?
yes
Do you like eating flautas?
yes

DEBRIEFING:
Thank you for...

false
```

### One More Big Example

It will take a number, like 22, and return the english version of it (in this case, the string 'twenty-two'). For now, let's have it only work on integers from 0 to 100.

```ruby
def englishNumber number
  # We only want numbers from 0-100.
  if number < 0
    return 'Please enter a number zero or greater.'
  end
  if number > 100
    return 'Please enter a number 100 or lesser.'
  end

  numString = ''  # This is the string we will return.

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left  = number
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    return 'one hundred'
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if write == 1  # Uh-oh...
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      if    left == 0
        numString = numString + 'ten'
      elsif left == 1
        numString = numString + 'eleven'
      elsif left == 2
        numString = numString + 'twelve'
      elsif left == 3
        numString = numString + 'thirteen'
      elsif left == 4
        numString = numString + 'fourteen'
      elsif left == 5
        numString = numString + 'fifteen'
      elsif left == 6
        numString = numString + 'sixteen'
      elsif left == 7
        numString = numString + 'seventeen'
      elsif left == 8
        numString = numString + 'eighteen'
      elsif left == 9
        numString = numString + 'nineteen'
      end
      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    elsif write == 2
      numString = numString + 'twenty'
    elsif write == 3
      numString = numString + 'thirty'
    elsif write == 4
      numString = numString + 'forty'
    elsif write == 5
      numString = numString + 'fifty'
    elsif write == 6
      numString = numString + 'sixty'
    elsif write == 7
      numString = numString + 'seventy'
    elsif write == 8
      numString = numString + 'eighty'
    elsif write == 9
      numString = numString + 'ninety'
    end

    if left > 0
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    if    write == 1
      numString = numString + 'one'
    elsif write == 2
      numString = numString + 'two'
    elsif write == 3
      numString = numString + 'three'
    elsif write == 4
      numString = numString + 'four'
    elsif write == 5
      numString = numString + 'five'
    elsif write == 6
      numString = numString + 'six'
    elsif write == 7
      numString = numString + 'seven'
    elsif write == 8
      numString = numString + 'eight'
    elsif write == 9
      numString = numString + 'nine'
    end
  end

  if numString == ''
    # The only way "numString" could be empty is if
    # "number" is 0.
    return 'zero'
  end

  # If we got this far, then we had a number somewhere
  # in between 0 and 100, so we need to return "numString".
  numString
end

puts englishNumber(  0)
puts englishNumber(  9)
puts englishNumber( 10)
puts englishNumber( 11)
puts englishNumber( 17)
puts englishNumber( 32)
puts englishNumber( 88)
puts englishNumber( 99)
puts englishNumber(100)
```

```text
zero
nine
ten
eleven
seventeen
thirty-two
eighty-eight
ninety-nine
one hundred
```

Let's use some arrays and try to clean it up a bit:

```ruby
def englishNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left  = number
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

puts englishNumber(  0)
puts englishNumber(  9)
puts englishNumber( 10)
puts englishNumber( 11)
puts englishNumber( 17)
puts englishNumber( 32)
puts englishNumber( 88)
puts englishNumber( 99)
puts englishNumber(100)
puts englishNumber(101)
puts englishNumber(234)
puts englishNumber(3211)
puts englishNumber(999999)
puts englishNumber(1000000000000)
```

```text
zero
nine
ten
eleven
seventeen
thirty-two
eighty-eight
ninety-nine
one hundred
one hundred one
two hundred thirty-four
thirty-two hundred eleven
ninety-nine hundred ninety-nine hundred ninety-nine
one hundred hundred hundred hundred hundred hundred
```

I think 'one trillion' would be a nicer return value for that last number, or even 'one million million' (though all three are correct).

### A Few Things to Try : Chapter 8

-   Expand upon englishNumber. First, put in thousands. So it should return 'one thousand' instead of 'ten hundred' and 'ten thousand' instead of 'one hundred hundred'.

-   Expand upon englishNumber some more. Now put in millions, so you get 'one million' instead of 'one thousand thousand'. Then try adding billions and trillions. How high can you go?

-   How about weddingNumber? It should work almost the same as englishNumber, except that it should insert the word "and" all over the place, returning things like 'nineteen hundred and seventy and two', or however wedding invitations are supposed to look. I'd give you more examples, but I don't fully understand it myself. You might need to contact a wedding coordinator to help you.

-   "Ninety-nine bottles of beer..." Using englishNumber and your old program, write out the lyrics to this song the right way this time. Punish your computer: have it start at 9999. (Don't pick a number too large, though, because writing all of that to the screen takes your computer quite a while. A hundred thousand bottles of beer takes some time; and if you pick a million, you'll be punishing yourself as well!)

## Classes : Chapter 9

We've seen several different kinds, or classes, of objects: strings, integers, floats, arrays, and a few special objects (true, false, and nil). In Ruby, these classes are always capitalized: String, Integer, Float, Array... etc. In general, if we want to create a new object of a certain class, we use new:

```ruby
a = Array.new  + [12345]  # Array  addition.
b = String.new + 'hello'  # String addition.
c = Time.new

puts 'a = '+a.to_s
puts 'b = '+b.to_s
puts 'c = '+c.to_s
```

```text
a = [12345]
b = hello
c = 2021-02-26 13:39:11 -0800
```

Because we can create arrays and strings using [...] and '...' respectively, we rarely create them using new.

### The Time Class

Time objects represent moments in time. You can add (or subtract) numbers to (or from) times to get new times: adding 1.5 to a time makes a new time one-and-a-half seconds later:

```ruby
time  = Time.new   # The moment I generated this web page.
time2 = time + 60  # One minute later.

puts time
puts time2
```

```text
2021-02-26 13:39:11 -0800
2021-02-26 13:40:11 -0800
```

You can also make a time for a specific moment using Time.mktime:

```ruby
puts Time.mktime(2000, 1, 1) # Y2K.
puts Time.mktime(1976, 8, 3, 10, 11) # When I was born.
```

```text
2000-01-01 00:00:00 -0800
1976-08-03 10:11:00 -0700
```

Notice: that's when I was born in Pacific Daylight Savings Time (PDT). When Y2K struck, though, it was Pacific Standard Time (PST), at least to us West Coasters.

### A Few Things to Try : Chapter 9

-   One billion seconds... Find out the exact second you were born (if you can). Figure out when you will turn (or perhaps when you did turn?) one billion seconds old. Then go mark your calendar.

-   Happy Birthday! Ask what year a person was born in, then the month, then the day. Figure out how old they are and give them a big SPANK! for each birthday they have had.

### The Hash Class

Hashes are a lot like arrays: they have a bunch of slots which can point to various objects. In an array, the slots are lined up in a row, and each one is numbered (starting from zero). In a hash, the slots aren't in a row (they are just sort of jumbled together), and you can use any object to refer to a slot, not just a number.

```ruby
colorArray = []  # same as Array.new
colorHash  = {}  # same as Hash.new

colorArray[0]         = 'red'
colorArray[1]         = 'green'
colorArray[2]         = 'blue'
colorHash['strings']  = 'red'
colorHash['numbers']  = 'green'
colorHash['keywords'] = 'blue'

colorArray.each do |color|
  puts color
end
colorHash.each do |codeType, color|
  puts codeType + ':  ' + color
end
```

```text
red
green
blue
strings:  red
numbers:  green
keywords:  blue
```

Though people usually use strings to name the slots in a hash, you could use any kind of object, even arrays and other hashes :

```ruby
weirdHash = Hash.new

weirdHash[12] = 'monkeys'
weirdHash[[]] = 'emptiness'
weirdHash[Time.new] = 'no time like the present'
```

Hashes and arrays are good for different things.

### Extending Classes

We could write something like 22.to_eng instead of englishNumber 22

```ruby
class Integer
  def to_eng
    if self == 5
      english = 'five'
    else
      english = 'fifty-eight'
    end

    english
  end
end

# I'd better test on a couple of numbers...
puts 5.to_eng
puts 58.to_eng
```

```text
five
fifty-eight
```

We defined an integer method by jumping into the Integer class, defining the method there, and jumping back out.

### Creating Classes

We could make the Die class:

```ruby
class Die

  def roll
    1 + rand(6)
  end

end

# Let's make a couple of dice...
dice = [Die.new, Die.new]

# ...and roll them.
dice.each do |die|
  puts die.roll
end
```

```text
6
2
```

If we skipped the section on random numbers, rand(6) just gives a random number between 0 and 5.

### Instance Variables

We could also call it a string object. Sometimes programmers might call it an instance of the class String, but this is just a fancy (and rather long-winded) way of saying string. An instance of a class is just an object of that class.

A method's local variables last until the method is finished. An object's instance variables, on the other hand, will last as long as the object does.

```ruby
class Die

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

end

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing
```

```text
4
4
6
6
```

So roll rolls the die and showing tells us which number is showing.

```ruby
class Die

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

end

# Since I'm not going to use this die again,
# I don't need to save it in a variable.
puts Die.new.showing
```

```text

```

It would be nice if we could set up our new die object right when it's created. That's what initialize is for:

```ruby
class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

end

puts Die.new.showing
```

```text
1
```

When an object is created, its initialize method (if it has one defined) is always called.

```ruby
class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.

    puts @name + ' is born.'
  end

  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private

  # "private" means that the methods defined here are
  # methods internal to the object.  (You can feed
  # your dragon, but you can't ask him if he's hungry.)

  def hungry?
    # Method names can end with "?".
    # Usually, we only do this if the method
    # returns true or false, like this:
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      # Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  # This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end

end

pet = Dragon.new 'Norbert'
pet.feed
pet.toss
pet.walk
pet.putToBed
pet.rock
pet.putToBed
pet.putToBed
pet.putToBed
pet.putToBed
```

```text
Norbert is born.
You feed Norbert.
You toss Norbert up into the air.
He giggles, which singes your eyebrows.
You walk Norbert.
You put Norbert to bed.
Norbert snores, filling the room with smoke.
Norbert snores, filling the room with smoke.
Norbert snores, filling the room with smoke.
Norbert wakes up slowly.
You rock Norbert gently.
He briefly dozes off...
...but wakes when you stop.
You put Norbert to bed.
He wakes up suddenly!
Norbert's stomach grumbles...
You put Norbert to bed.
He wakes up suddenly!
Norbert's stomach grumbles...
You put Norbert to bed.
He wakes up suddenly!
Norbert's stomach grumbles...
Norbert does the potty dance...
You put Norbert to bed.
He wakes up suddenly!
Norbert is starving!  In desperation, he ate YOU!
```

### A Few Things to Try : Chapter 9.1

-   Make an OrangeTree class. It should have a height method which returns its height, and a oneYearPasses method, which, when called, ages the tree one year. Each year the tree grows taller (however much you think an orange tree should grow in a year), and after some number of years (again, your call) the tree should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than younger trees... whatever you think makes most sense. And, of course, you should be able to countTheOranges (which returns the number of oranges on the tree), and pickAnOrange (which reduces the @orangeCount by one and returns a string telling you how delicious the orange was, or else it just tells you that there are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year.

-   Write a program so that you can interact with your baby dragon. You should be able to enter commands like feed and walk, and have those methods be called on your dragon. Of course, since what you are inputting are just strings, you will have to have some sort of method dispatch, where your program checks which string was entered, and then calls the appropriate method.

## Blocks and Procs : Chapter 10

It's the ability to take a block of code (code in between do and end), wrap it up in an object (called a proc), store it in a variable or pass it to a method, and run the code in the block whenever you feel like (more than once, if you want). So it's kind of like a method itself, except that it isn't bound to an object (it is an object), and you can store it or pass it around like you can with any object.

```ruby
toast = Proc.new do
  puts 'Cheers!'
end

toast.call
toast.call
toast.call
```

```text
Cheers!
Cheers!
Cheers!
```

Actually, it's even more like a method than I have shown you, because blocks can take parameters:

```ruby
doYouLike = Proc.new do |aGoodThing|
  puts 'I *really* like '+aGoodThing+'!'
end
```

```text
doYouLike.call 'chocolate'
doYouLike.call 'ruby'

I *really* like chocolate!
I *really* like ruby!
```

### Methods Which Take Procs

When we pass a proc into a method, we can control how, if, or how many times we call the proc.

```ruby
def doSelfImportantly someProc
  puts 'Everybody just HOLD ON!  I have something to do...'
  someProc.call
  puts 'Ok everyone, I\'m done.  Go on with what you were doing.'
end

sayHello = Proc.new do
  puts 'hello'
end

sayGoodbye = Proc.new do
  puts 'goodbye'
end

doSelfImportantly sayHello
doSelfImportantly sayGoodbye
```

```text
Everybody just HOLD ON!  I have something to do...
hello
Ok everyone, I'm done.  Go on with what you were doing.
Everybody just HOLD ON!  I have something to do...
goodbye
Ok everyone, I'm done.  Go on with what you were doing.
```

Here's a method which will call the proc passed in about half of the time, and another which will call it twice:

```ruby
def maybeDo someProc
  if rand(2) == 0
    someProc.call
  end
end

def twiceDo someProc
  someProc.call
  someProc.call
end

wink = Proc.new do
  puts '<wink>'
end

glance = Proc.new do
  puts '<glance>'
end

maybeDo wink
maybeDo glance
twiceDo wink
twiceDo glance
```

```text
<wink>
<wink>
<glance>
<glance>
```

The method will return the last non-false value returned by the proc.

```ruby
def doUntilFalse firstInput, someProc
  input  = firstInput
  output = firstInput

  while output
    input  = output
    output = someProc.call input
  end

  input
end

buildArrayOfSquares = Proc.new do |array|
  lastNumber = array.last
  if lastNumber <= 0
    false
  else
    array.pop                         # Take off the last number...
    array.push lastNumber*lastNumber  # ...and replace it with its square...
    array.push lastNumber-1           # ...followed by the next smaller number.
  end
end

alwaysFalse = Proc.new do |justIgnoreMe|
  false
end

puts doUntilFalse([5], buildArrayOfSquares).inspect
puts doUntilFalse('I\'m writing this at 3:00 am; someone knock me out!', alwaysFalse)
```

```text
[25, 16, 9, 4, 1, 0]
I'm writing this at 3:00 am; someone knock me out!
```

### Methods Which Return Procs

We can do with procs is to create them in methods and return them. This allows all sorts of crazy programming power (things with impressive names, like lazy evaluation, infinite data structures, and currying).
In this example, compose takes two procs and returns a new proc which, when called, calls the first proc and passes its result into the second proc.

```ruby
def compose proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end

squareIt = Proc.new do |x|
  x * x
end

doubleIt = Proc.new do |x|
  x + x
end

doubleThenSquare = compose doubleIt, squareIt
squareThenDouble = compose squareIt, doubleIt

puts doubleThenSquare.call(5)
puts squareThenDouble.call(5)
```

```text
100
50
```

### Passing Blocks (Not Procs) into Methods

A lot of the problem is that there are three steps you have to go through (defining the method, making the proc, and calling the method with the proc), when it sort of feels like there should only be two (defining the method, and passing the block right into the method, without using a proc at all), since most of the time you don't want to use the proc/block after you pass it into the method.

```ruby
class Array
  def eachEven(&wasABlock_nowAProc)
    # We start with "true" because arrays start with 0, which is even.
    isEven = true

    self.each do |object|
      if isEven
        wasABlock_nowAProc.call object
      end

      isEven = (not isEven)  # Toggle from even to odd, or odd to even.
    end
  end
end

['apple', 'bad apple', 'cherry', 'durian'].eachEven do |fruit|
  puts 'Yum!  I just love '+fruit+' pies, don\'t you?'
end

# Remember, we are getting the even-numbered elements
# of the array, all of which happen to be odd numbers,
# just because I like to cause problems like that.
[1, 2, 3, 4, 5].eachEven do |oddBall|
  puts oddBall.to_s+' is NOT an even number!'
end
```

```text
Yum!  I just love apple pies, don't you?
Yum!  I just love cherry pies, don't you?
1 is NOT an even number!
3 is NOT an even number!
5 is NOT an even number!
```

I remember one time I wanted to be able to time how long different sections of a program were taking. (This is also known as profiling the code.)

```ruby
def profile descriptionOfBlock, &block
  startTime = Time.now

  block.call

  duration = Time.now - startTime

  puts descriptionOfBlock+':  '+duration.to_s+' seconds'
end

profile '25000 doublings' do
  number = 1

  25000.times do
    number = number + number
  end

  # Show the number of digits in this HUGE number.
  puts number.to_s.length.to_s+' digits'
end

profile 'count to a million' do
  number = 0

  1000000.times do
    number = number + 1
  end
end
```

```text
7526 digits
25000 doublings:  0.026852 seconds
count to a million:  0.039258 seconds
```

### A Few Things to Try : Chapter 10

-   Grandfather Clock. Write a method which takes a block and calls it once for each hour that has passed today. That way, if I were to pass in the block do puts 'DONG!' end, it would chime (sort of) like a grandfather clock. Test your method out with a few different blocks (including the one I just gave you).
    **Hint**: You can use Time.now.hour to get the current hour. However, this returns a number between 0 and 23, so you will have to alter those numbers in order to get ordinary clock-face numbers (1 to 12).
-   Program Logger. Write a method called log, which takes a string description of a block and, of course, a block. Similar to doSelfImportantly, it should puts a string telling that it has started the block, and another string at the end telling you that it has finished the block, and also telling you what the block returned. Test your method by sending it a code block. Inside the block, put another call to log, passing another block to it. (This is called nesting.) In other words, your output should look something like this:

    ```text
    Beginning "outer block"...
    Beginning "some little block"...
    ..."some little block" finished, returning:  5
    Beginning "yet another block"...
    ..."yet another block" finished, returning:  I like Thai food!
    ..."outer block" finished, returning:  false
    ```

-  Better Logger. The output from that last logger was kind of hard to read, and it would just get worse the more you used it. It would be so much easier to read if it indented the lines in the inner blocks. To do this, you'll need to keep track of how deeply nested you are every time the logger wants to write something. To do this, use a global variable, a variable you can see from anywhere in your code. To make a global variable, just precede your variable name with $, like these: $global, $nestingDepth, and $bigTopPeeWee. In the end, your logger should output code like this:

    ```text
    Beginning "outer block"...
    Beginning "some little block"...
        Beginning "teeny-tiny block"...
        ..."teeny-tiny block" finished, returning:  lots of love
    ..."some little block" finished, returning:  42
    Beginning "yet another block"...
    ..."yet another block" finished, returning:  I love Indian food!
    ..."outer block" finished, returning:  true
    ```

## References

- <https://pine.fm/LearnToProgram/chap_01.html>