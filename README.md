SpaceSaving
===========

Space Saving algorithm implementation in Ruby, also know as "HeavyHitter"

The purpose of the algorithm is to find the most frequently used items from an inifinite stream of item
with a finit list.

In other words, even if you have millions of different values, the algorithm will try to find the most frequently used.

See articles like this one for more informations: http://boundary.com/blog/2013/05/14/approximate-heavy-hitters-the-spacesaving-algorithm/

Usage:

test=SpaceSaving.new 10_000

The parameter is the size of the finit list used internally

Add an item:


test.add_entry "hi",10

"hi" is the key of the entry
10 is the weight of this entry, default is 1

to get the results:

test.counts is an hash key, count
test.errors is an hash key, errors

Test program:

The sample included count the number of occurence of each URL in twitter stream. Every 1000 tweets parsed, the top 30 links are displayed in the console

just run "ruby sample.rb"



