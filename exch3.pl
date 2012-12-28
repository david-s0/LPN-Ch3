%3.1
inDoll(katarina, olga).
inDoll(olga, natasha).
inDoll(natasha, irina).

in(X, Y) :-
	inDoll(X, Y).
in(X, Y) :-
	inDoll(X, Z),
	in(Z, Y).

%3.2
greater_than(succ(X), 0).
greater_than(succ(X), succ(Y)) :-
	greater_than(X, Y).

%3.3
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(X, Y) :-
	directTrain(X, Y).
travelBetween(X, Y) :-
	directTrain(Y, X).
travelBetween(X, Y) :-
	directTrain(X, Z),
	travelBetween(Z, Y).
travelBetween(X, Y) :-
	directTrain(Y, Z),
	travelBetween(Z, X).

%Practical 1 - Probably there is a neater soltion! I think I made the program to clever in terms of finding all possible paths and that works very well in part 1 but becomes a nightmare in parts 2 and 3
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

go(X, Y) :-
	byCar(X, Y).
go(X, Y) :-
	byCar(Y, X).
go(X, Y) :-
	byCar(X, Z),
	go(Z, Y).
go(X, Y) :-
	byCar(Y, Z),
	go(Z, X).

go(X, Y) :-
	byTrain(X, Y).
go(X, Y) :-
	byTrain(Y, X).
go(X, Y) :-
	byTrain(X, Z),
	go(Z, Y).
go(X, Y) :-
	byTrain(Y, Z),
	go(Z, X).

go(X, Y) :-
	byPlane(X, Y).
go(X, Y) :-
	byPlane(Y, X).
go(X, Y) :-
	byPlane(X, Z),
	go(Z, Y).
go(X, Y) :-
	byPlane(Y, Z),
	go(Z, X).

travel(X, Y) :-
	go(X, Y).

%Practical 2
travel(X, Y, go(X, Y)) :-
	go(X, Y).
travel(X,Y,go(X,Z,G)) :-
	travel(X,Z,go(X,Z)),
	travel(Z,Y,G).

%Practical 3
travel(X, Y, go(X, Y, byCar)) :-
	byCar(X, Y).
travel(X, Y, go(X, Y, byTrain)) :-
	byTrain(X, Y).
travel(X, Y, go(X, Y, byPlane)) :-
	byPlane(X, Y).
travel(X, Y, go(X, Z, V, G)) :-
	travel(X, Z, go(X, Z, V)),
	travel(Z, Y, G).