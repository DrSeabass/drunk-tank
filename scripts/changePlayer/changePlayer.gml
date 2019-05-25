if global.player == playing.cpu {
	global.player = playing.player
	selectNextAvailablePlayer(playing.cpu)
}else{
	global.player = playing.cpu
	selectNextAvailablePlayer(playing.player)
}

global.remaining_throws = global.throws_per_turn
