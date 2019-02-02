# word-dictionary

In this we could map the sample of 10 digits number into words.

Given 10 digit number, must return all possible words or combination of words from the provided dictionary.

With this we can generate numbers like 1-800-motortruck which is easier to remember then 1-800-6686787825
The phone number mapping to letters is as follows:

2 = a b c \
3 = d e f \
4 = g h i \
5 = j k l \
6 = m n o \
7 = p q r s \
8 = t u v \
9 = w x y z \

The phone numbers will never contain a 0 or 1.
Words have to be at least 3 characters.

To get give you an initial verification, the following must be true:

`6686787825` should return the following list `[["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"]`.

`2282668687` should return the following list `[["act", "amounts"], ["act", "contour"], ["acta", "mounts"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], "catamounts"]`.

The conversion of a 10 digit phone number should be performed within 1000ms.

#####Usage
  `bundle exec ruby dictionary.rb 6686787825`

#####Rspec
  `bundle exec rspec`

#####Rubocop
 `rubocop`
