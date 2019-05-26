if (global.gamestate != game_state.throwing){
	return
}

if (global.screenstate == throw_screen_state.plunging){
	if self.sprite_index != sprManInGlass{
		self.sprite_index = sprManInGlass
		self.image_index = 0
	}else{
		if self.image_index > self.image_number - 1 {
			global.screenstate = throw_screen_state.drinking
		}
	}
}

if (global.screenstate == throw_screen_state.drinking) {
	if self.sprite_index != sprManDrinkingGlass{
		self.sprite_index = sprManDrinkingGlass
		self.image_index = 0;
	}
	if global.player == playing.player { // player playing, cpu drinking
		var beer_step = irandom(5)
		self.remaining_beer -= beer_step
	} else if global.player == playing.cpu {
		if (global.act != self.previous_act){
			self.remaining_beer -= 1
		}
	}
	
	self.image_index = self.image_number * (1 - (self.remaining_beer / 100))
	
	if (self.remaining_beer <= 0){
		show_debug_message("Drinking over, go again")
		self.sprite_index = sprFullSteinBubbling
		self.image_index = 0
		global.screenstate = throw_screen_state.start_throw
		self.remaining_beer = 100
		changePlayer()
	}
}