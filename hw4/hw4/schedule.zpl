set Day := {1..7};
set I := {read "events.txt" as "<1s>" };
param funday[I] := read "events.txt" as "<1s> 2n";
param funduration[I] := read "events.txt" as "<1s> 3n";
param funrate[I] := read "events.txt" as "<1s> 4n";
set O := {read "assignments.txt" as "<1s>" };
param workdueday[O] := read "assignments.txt" as "<1s> 2n";
param workduration[O] := read "assignments.txt" as "<1s> 3n";
param pena[O] := read "assignments.txt" as "<1s> 4n";

var work[Day] real;
var sleep[Day] real;
var play[Day] real;
var go[I] binary;
var eventTime[Day] real;
var workdone[O] real;
var work1[Day * O] real;
var totalpenalty;
param base_fun_rate := 1;

var playtotal real;
var eventotal real;

subto playto: playtotal ==  sum<b> in Day :play[b] * base_fun_rate;
subto eveto: eventotal == sum<a> in I: go[a] * funduration[a] * funrate[a];
maximize fun: playtotal + eventotal-totalpenalty;

subto totalpenalt: (sum<a> in O: (workduration[a] - workdone[a]) * pena[a]) == totalpenalty;
subto hw: forall<a> in Day :   work[a] == ( sum<b> in O: work1[a,b]) ; 
subto eachhwdone:  forall <b,c> in O * Day:   if (workdueday[b] >=c ) then workdone[b] == sum<c> in Day: work1[c,b] else 1==1 end;


subto gotoEvent: forall <a,b> in Day * I: if (a == funday[b]) then eventTime[a] == go[b] * funduration[b]  else 1==1 end;
subto oneday: forall <p> in Day : work[p] + sleep[p] + play[p] + eventTime[p] == 24;
subto sleepconstraint: forall <p> in Day without {6,7}: sleep[p] + sleep[p+1] + sleep[p+2] >= 18;

#subto sleepdeficit: forall <p> in Day without{1,2} : if ((sleep[p] + sleep[p-1] + sleep[p-2]) <=24) then work[p] == work[p]*.75 else 1 == 1 end;
