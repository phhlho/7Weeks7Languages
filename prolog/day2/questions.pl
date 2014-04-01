appender([],Ys,Ys).
appender([X|Xs],Ys,[X|Zs]) :- appender(Xs,Ys,Zs).
concatenate([], List, List). 
concatenate([Head|Tail1], List, [Head|Tail2]) :- concatenate(Tail1, List, Tail2).
reverser(Input, Result) :- reverser(Input, [], Result).
reverser([],List,List).
reverser([Head1|Tail1], List, Result) :- reverser(Tail1, [Head1|List], Result).
smallest(Input, Result) :- smallest(Input, [], Result).
smallest([], Smalls, Smalls).
smallest([Head1|Tail1], Smalls, Result) :- (Smalls = [] -> NewSmallest is Head1; Smalls < Head1 -> NewSmallest is Smalls; NewSmallest is Head1), smallest(Tail1, NewSmallest, Result).
sorter(Input, Result) :- sorter(Input, [], Result).
pivoter(Val,[],[],[]).
pivoter(H,[X|T],[X|L],G):- X >= H, pivoter(H,T,L,G).
pivoter(H,[X|T],L,[X|G]):- X < H,pivoter(H,T,L,G).
sorter([], List, List).
sorter([Head1|Tail1],List,Sorted):- pivoter(Head1,Tail1,List1,List2), sorter(List1,List,Sorted1),sorter(List2,[Head1|Sorted1],Sorted).
