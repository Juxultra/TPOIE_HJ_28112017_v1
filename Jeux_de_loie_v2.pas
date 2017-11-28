
PROGRAM Jeu_de_l_Oie ;

	// BUT : Réaliser un Jeu de l Oie.
	// PRINCIPE : Faire boucle pour jet de dés. Calculer place du joueur suite au jet. 
	//			  Prendre en compte cases bonus ou case malus. Calculer de combien reculer si le joueur dépasse case arrivée. 
	// ENTRÉES : Le lancer de dés.
	// SORTIE : La place du joueur sur la case 66. 

uses crt ;	
	

VAR
	play : STRING ;
	relancer : BOOLEAN ; 	// Variables pour relancer le programme. 
	place, des, trop, oie : INTEGER ;	 // Initialisation des variables.

	
	

BEGIN

	clrscr ;

	place:= 0 ;
	oie:=(place MOD 9) ;

	WRITELN ('/!\ Jeu de l`Oie /!\') ;
	WRITELN ;
	WRITELN ('Vous avez 66 pour vous déplacer. Si vous parvenez à terminer à la case 66, le jeu est gagne.') ;
	WRITELN ;
	WRITELN ('Appuyer Enter sur pour commencer le jeux.') ;

		// Lancement du jeux. 

	READLN ;


REPEAT
	
	
	REPEAT

		WRITELN ('Appuyer sur Enter pour lancer les des.') ;
		READLN ;

		randomize;
		des:= RANDOM (10)+2 ;    // Initialisation des dés. 

		WRITELN ('Vous avez fait un ', des, '.') ;
		READLN ;
		place:= (place + des);
		WRITELN ('Vous etes maintenant sur la ', place, ' cases.') ;
		
		IF (place = oie) AND (place <> 63) THEN

			BEGIN
				place:= (place+des) ; 	//  si l'utilisateur tombe sur une case de l'Oie. 
				WRITELN ('Vous etes sur une case oie! Vos des sont doublés. Vous êtes maintenant sur la ', place, ' cases.') ; 
			END ;


		IF (place = 58) THEN

			BEGIN
				place:= 0 ;		//  si l'utilisateur tombe sur la case Tête de mort. 
				WRITELN ('Vous etes tombe sur la case mortelle. Vous revenez au début sur la case 1.') ;
			END ;

		IF (place > 66) THEN 

			BEGIN 
				trop:=(place-66+des) ;		// Calcul du nombre à reculer si l'utilisateur dépasse l'arrivée. 
				WRITELN ('Vous etes alle trop loin. Vous devez revenir de', trop, ' cases.') ;
				place:= (place - trop) ; 
			END ;

	UNTIL (place = 66) ; // Fin de boucle


	WRITELN ('Vous avez gagne! Merci d avoir jouer.') ;

	WRITELN ('Tapez "Jouer" pour redemarrer le jeu. Ou tapez "Quitter" pour quitter le jeu') ; // pour rejouer ou quiter
	READLN (play) ;
	play := lowercase(play) ;


	IF (play<>('jouer')) OR (play<>('quitter'))  THEN 

		REPEAT
			WRITELN ('Erreur vous n avais pas saisie Jouer ou Quitter') ;
			WRITELN ('Retapez votre choix, jouer ou Quitter') ;
			READLN (play) ;
			play := lowercase(play) ;
		UNTIL (play=('jouer')) OR (play=('quitter')) ;

	IF (play=('jouer')) THEN
		relancer:=TRUE ;
		place:=0 ;


	IF (play=('quitter')) THEN
		relancer:=FALSE ;
		

UNTIL (relancer=FALSE) ;


END.