var remainingPlayers = argument0
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);

room_goto(rEndGame)

switch(remainingPlayers){
	case 0:
		layer_background_index(back_id, sprLoss)
	break
	case 1:
		layer_background_index(back_id, sprVictory1)
	break
	case 2:
		layer_background_index(back_id, sprVictory2)
	break
	case 3:
		layer_background_index(back_id, sprVictory3)
	break
}