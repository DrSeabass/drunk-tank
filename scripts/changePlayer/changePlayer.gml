var wipe = instance_create_depth(0,0,-100,objWiper);
global.screenstate = throw_screen_state.wiping
wipe.nextScreenState = throw_screen_state.start_throw

if global.player == playing.cpu {
	global.player = playing.player
	selectNextAvailablePlayer(playing.cpu)
}else{
	global.player = playing.cpu
	selectNextAvailablePlayer(playing.player)
}

global.remaining_throws = global.throws_per_turn
