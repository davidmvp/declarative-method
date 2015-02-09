# Constraints for n^2 x n^2 Sudoku puzzles.

param n := 3;
param dim := n*n;
set R := {1..dim};  # row indices
set C := {1..dim};  # col indices
set D := {1..dim};  # possible digits
set B := {1..n}*{1..n};   # block-internal indices
var x[R*C*D] binary;  # does digit D appear at coordinates (R,C)?

# There are constraints, but nothing to maximize or minimize.

subto uniq:  forall <q,w> in R*C do
		sum<a> in D: x[q,w,a] == 1;   # exactly one digit per cell
subto row:   forall <y,z> in C*D do
		sum<a> in R:  x[a,y,z] ==1;   # each digit appears once per row
subto col:   forall <o,p> in R*D do
		sum<a> in C:  x[o,a,p] == 1;
   # each digit appears once per column
subto block:   forall <i,o,p> in B*D do
		sum<a,b> in B: x[(i-1)*n+a,(o-1)*n+b,p] == 1; # each digit appears once per block
# Some of the digits are given.  Read these from file sudoku.txt and
# further constrain the solution to match these.

set Givens := { read "sudoku.txt" as "<1n,2n,3n>" comment "#" };
minimize rotsym:  sum <r,c,d> in R*C*D:  vabs(x[r,c,d] -  x[dim+1-r,dim+1-c,d]) ;

subto no_permute_digits: forall <a> in C: x[1,a,a] == 1;
