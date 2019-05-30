var remainingPlayers = argument0

switch(remainingPlayers){
	case 0:
		global.endscreen = sprLoss
	break
	case 1:
		global.endscreen = sprVictory1
	break
	case 2:
		global.endscreen = sprVictory2
	break
	case 3:
		global.endscreen = sprVictory3
	break
}

room_goto(rEndGame)