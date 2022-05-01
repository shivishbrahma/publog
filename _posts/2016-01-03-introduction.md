---
layout: post
title: Introduction To Ruby
tags: ruby programming
---

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

###  The Methods gets and chomp 
