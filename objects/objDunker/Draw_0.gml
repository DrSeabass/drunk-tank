event_inherited()
draw_sprite_stretched(self.sprite_index, self.image_index, self.x - self.sprite_width/2, self.y - self.sprite_height/2,self.sprite_width, self.sprite_height)
if global.gamestate == game_state.throwing {
	if (global.screenstate == throw_screen_state.ball_in_flight 
	  ||global.screenstate == throw_screen_state.throw_input
	  ||global.screenstate == throw_screen_state.throwing
	  ||global.screenstate == throw_screen_state.start_throw
	  ||global.screenstate == throw_screen_state.wiping){
		draw_sprite(sprBaseManSeated, -2, x - sprite_width / 16, y - sprite_width / 8)
	  }
}