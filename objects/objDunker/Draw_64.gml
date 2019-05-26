if global.gamestate == game_state.throwing {
	if (global.screenstate == throw_screen_state.ball_in_flight 
	  ||global.screenstate == throw_screen_state.throw_input
	  ||global.screenstate == throw_screen_state.throwing
	  ||global.screenstate == throw_screen_state.start_throw){
		draw_sprite(sprBaseManSeated, -2, x - sprite_width / 16, y - sprite_width / 8)
	  }
}
event_inherited()