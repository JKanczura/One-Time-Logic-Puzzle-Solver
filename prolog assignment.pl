sizes(4).
sizes(5).
sizes(6).
sizes(7).

manufacturers(abbotthill).
manufacturers(manzarita).
manufacturers(graffetz).
manufacturers(williford).

customer(genevieve).
customer(lucia).
customer(vanessa).
customer(shawna).


solve :-
	manufacturers(GenevievesShoe), manufacturers(LuciasShoe),
	manufacturers(ShawnasShoe), manufacturers(VanessasShoe),
	all_different([GenevievesShoe, LuciasShoe, ShawnasShoe, VanessasShoe]),
    

	sizes(GenevievesSize), sizes(LuciasSize), sizes(ShawnasSize),
	sizes(VanessasSize),
	all_different([GenevievesSize, LuciasSize, ShawnasSize, VanessasSize]),

	Triples = 
	[[genevieve, GenevievesShoe, GenevievesSize],
	[lucia, LuciasShoe, LuciasSize],
	[shawna, ShawnasShoe, ShawnasSize],
	[vanessa, VanessasShoe, VanessasSize]],
        

		
	%1. Of the Manzarita footwear and Lucia's pair, one was a size 7 and the other was a size 4.
	
	((member([lucia, _, 7], Triples),
	member([_, manzarita, 4], Triples));
	(member([lucia, _, 4], Triples),
	member([_, manzarita, 7], Triples)) ),
    
    not(member([lucia, manzarita, _], Triples)),
	

	%2. Genevieve's pair was 2 sizes smaller than the Abbott Hill footwear.

	((member([genevieve, _, 5], Triples),
	member([_, abbotthill, 7], Triples));
    
	(member([genevieve, _, 4], Triples),
	member([_, abbotthill, 6], Triples)) ),
    
    not(member([genevieve, abbotthill, _], Triples)),
	

	%3. Vanessa's pair was 2 sizes larger than Genevieve's pair.

	((member([vanessa, _, 6], Triples),
	member([genevieve, _, 4], Triples));
    
	
	(member([vanessa, _, 7], Triples),
	member([genevieve, _, 5], Triples)) ),
    

	%4. The Graffetz footwear was somewhat larger than Shawna's pair.

	((member([shawna, _, 6], Triples),
	member([_, graffetz, 7], Triples));
    
	((member([shawna, _, 5], Triples),
	member([_, graffetz, 7],Triples);
	member([_, graffetz, 6], Triples)));
    
	((member([shawna, _, 4], Triples),
	member([_, graffetz, 5], Triples);
	member([_, graffetz, 6], Triples);
	member([_, graffetz, 7], Triples))) ),
    
    not(member([shawna, graffetz, _], Triples)),
    not(member([_, graffetz, 4], Triples)),

    
  

    tell(genevieve, GenevievesShoe, GenevievesSize),
	tell(lucia, LuciasShoe, LuciasSize),
	tell(shawna, ShawnasShoe, ShawnasSize),
	tell(vanessa, VanessasShoe, VanessasSize).
    
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).


tell(X, Y, Z) :-
		write(X), 
        write(' bought a size '), 
        write(Z), 
		write(" "),
        write(Y),
        write(" shoe"), 
        write("."), nl.
     