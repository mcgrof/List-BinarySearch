#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use List::BinarySearch;

# lib/List/BinarySearch.pm Line 229.
is(
  ( List::BinarySearch::binsearch_range { $a <=> $b } 200, 500, @{[100,200,300,400]} ),
  3,
  'binsearch_range: Adjusts for overshooting range.'
);

is(
  ( List::BinarySearch::binsearch_range { $a <=> $b } 200, 350, @{[100,200,300,400]} ),
  2,
  'binsearch_range: Correct range when upper bound is in-bounds but not found.'
);

is(
  ( List::BinarySearch::binsearch { $a <=> $b } 99, @{[100]} ),
  undef,
  'binsearch: Match in range but not found.'
);

is(
  ( List::BinarySearch::binsearch { $a <=> $b } 250, @{[100]} ),
  undef,
  'binsearch: Match in range but not found.'
);

is(
  ( List::BinarySearch::binsearch { $a <=> $b } 101, @{[100]} ),
  undef,
  'binsearch: Match in range but not found.'
);

is
(
 ( List::BinarySearch::binsearch_range { $a <=> $b }  200, 200, @{[100, 200, 300, 400]} ),
 1,
 "binsearch_range_num: correct indices for 200 and 500"
);

is
(
 ( List::BinarySearch::binsearch_range { $a <=> $b }  200, 500, @{[100, 200, 300, 400]} ),
 3,
 "binsearch_range_num: correct indices for 200 and 500"
);

is
(
 ( List::BinarySearch::binsearch_range { $a <=> $b }  50, 50, @{[100, 200, 300, 400]} ),
 -1,
 "binsearch_range_num: correct indices for 200 and 500"
);

is
(
 ( List::BinarySearch::binsearch_range { $a <=> $b }  150, 150, @{[100, 200, 300, 400]} ),
 0,
 "binsearch_range_num: correct indices for 200 and 500"
);

is_deeply
(
 [( List::BinarySearch::binsearch_range { $a <=> $b }  150, 150, @{[100, 200, 300, 400]} )],
 [1, 0],
 "binsearch_range_num: correct indices for 200 and 500"
);

is_deeply
(
 [( List::BinarySearch::binsearch_range { $a <=> $b }  150, 150, @{[100, 200, 300, 400]} )],
 [1, 0],
 "binsearch_range_num: correct indices for 200 and 500"
);

is_deeply
(
 [( List::BinarySearch::binsearch_range { $a <=> $b }  50, 150, @{[100, 200, 300, 400]} )],
 [0, 0],
 "binsearch_range_num: correct indices for 200 and 500"
);

is_deeply
(
 [( List::BinarySearch::binsearch_range { $a <=> $b }  10, 50, @{[100, 200, 300, 400]} )],
 [0, -1],
 "binsearch_range_num: correct indices for 200 and 500"
);

done_testing();
